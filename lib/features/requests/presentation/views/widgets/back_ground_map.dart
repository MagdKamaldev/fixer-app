// ignore_for_file: deprecated_member_use, unrelated_type_equality_checks

import 'package:fixer/core/location/location_services.dart';
import 'package:fixer/core/networks/errors/error_snackbar.dart';
import 'package:fixer/features/requests/manager/cubit/request_cubit.dart';
import 'package:fixer/features/requests/presentation/views/widgets/google_map.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class BackGroundMap extends StatefulWidget {
  const BackGroundMap({super.key});

  @override
  State<BackGroundMap> createState() => _BackGroundMapState();
}

class _BackGroundMapState extends State<BackGroundMap> {
  late LocationServices locationServices;
  late CameraPosition cameraPosition;

  @override
  void initState() {
    if (markers.isNotEmpty) {
      cameraPosition = CameraPosition(
          zoom: 16,
          target: LatLng(markers.first.position.latitude,
              markers.first.position.longitude));
    }

    locationServices = LocationServices();

    updateLocation(context);

    super.initState();
  }

  BitmapDescriptor? icon;

  GoogleMapController? googleMapController;
  Set<Marker> markers = {};

  void initMapStyle() async {
    var style = await DefaultAssetBundle.of(context)
        .loadString("assets/maps_styles/app_styles.json");
    googleMapController!.setMapStyle(style);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestCubit(),
      child: BlocBuilder<RequestCubit, RequestState>(
        builder: (context, state) {
          return Stack(
            children: [
              if (markers.isEmpty)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              if (markers.isNotEmpty &&
                  locationServices.isPermissionGranted == true)
                GoogleMap(
                  myLocationButtonEnabled: true,
                  markers: RequestCubit.get(context).markers.isEmpty
                      ? markers
                      : RequestCubit.get(context).markers,
                  onMapCreated: (controller) {
                    googleMapController = controller;
                    initMapStyle();
                  },
                  initialCameraPosition:
                      RequestCubit.get(context).cameraPosition ??
                          cameraPosition,
                  zoomControlsEnabled: false,
                  tiltGesturesEnabled: false,
                  scrollGesturesEnabled: false,
                  rotateGesturesEnabled: false,
                  zoomGesturesEnabled: false,
                ),
            ],
          );
        },
      ),
    );
  }

  void updateLocation(context) async {
    bool hasService = await locationServices.checkAndRequestLocationService();
    if (!hasService) {
      showErrorSnackbar(context, S.of(context).locationServicesDisabled);
      return;
    }

    bool hasPermission =
        await locationServices.checkAndRequestLocationPermission();

    if (hasPermission) {
      locationServices.getRealTimeLocationData((currentLocation) {
        cameraPosition = CameraPosition(
            target:
                LatLng(currentLocation.latitude!, currentLocation.longitude!),
            zoom: 16);

        setLocationMarker(currentLocation);
        setCameraPosition(currentLocation);
      });
    } else {
      showErrorSnackbar(context, S.of(context).locationPermissionDenied);
    }
  }

  void setLocationMarker(LocationData currentLocation) async {
    Marker myLocationMarker = Marker(
      markerId: const MarkerId("myLocation"),
      position: LatLng(currentLocation.latitude!, currentLocation.longitude!),
      icon: icon ??
          await BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty,
            "assets/images/house.png",
          ),
      infoWindow: const InfoWindow(title: "My Location"),
    );
    markers.add(myLocationMarker);
    setState(() {});
  }

  void setCameraPosition(LocationData currentLocation) {
    CameraPosition cameraPosition = CameraPosition(
        target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
        zoom: 16);
    googleMapController!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }
}

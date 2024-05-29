// ignore_for_file: deprecated_member_use
import 'package:fixer/core/location/location_services.dart';
import 'package:fixer/core/networks/errors/error_snackbar.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/buttons/default_button.dart';
import 'package:fixer/features/user_sign_up/presentation/user_signup_layout/presentation/views/widgets/user_address_view.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:ui' as ui;

String? cityName = "other";
String? lat = "";
String? long = "";

class SetUserLocation extends StatefulWidget {
  const SetUserLocation({super.key});

  @override
  State<SetUserLocation> createState() => _SetUserLocationState();
}

class _SetUserLocationState extends State<SetUserLocation> {
  late LocationServices locationServices;
  late CameraPosition cameraPosition;

  @override
  void initState() {
    if (markers.isNotEmpty) {
      cameraPosition = CameraPosition(
          zoom: 15.5,
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
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).setHomeLocation, style: TextStyles.bodybold),
        toolbarHeight: 60.h,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          if (markers.isEmpty)
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (markers.isNotEmpty &&
              locationServices.isPermissionGranted == true)
            GoogleMap(
              myLocationButtonEnabled: true,
              onTap: (LatLng latLng) async {
                markers.clear();
                markers.add(Marker(
                  onTap: () => showErrorSnackbar(
                    context,
                    "Long press to move",
                  ),
                  markerId: const MarkerId('userLocationMarker'),
                  position: latLng,
                  draggable: true,
                  onDragEnd: (LatLng t) {},
                  icon: icon ??
                      await BitmapDescriptor.fromAssetImage(
                        ImageConfiguration.empty,
                        "assets/images/house.png",
                      ),
                ));

                setState(() {});
              },
              markers: markers,
              onMapCreated: (controller) {
                googleMapController = controller;
                initMapStyle();
              },
              initialCameraPosition: cameraPosition,
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
            ),
          if (markers.isNotEmpty &&
              locationServices.isPermissionGranted == true)
            Padding(
              padding: EdgeInsets.only(
                  left: 20.sp, right: 100.sp, top: 20.sp, bottom: 20.sp),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: DefaultButton(
                      text: S.of(context).confirmLocation,
                      onPressed: () async {
                        Navigator.pop(
                          context,
                        );
                        List<Placemark> placemarks =
                            await placemarkFromCoordinates(
                          markers.first.position.latitude,
                          markers.first.position.longitude,
                        );
                        cityName = placemarks.first.subAdministrativeArea!;
                        areaControler.text =
                            placemarks.first.subAdministrativeArea!;
                        lat = markers.first.position.latitude.toString();
                        long = markers.first.position.longitude.toString();
                        if (cityName == "" || cityName == null) {
                          areaControler.text = "Other";
                        }
                      })),
            )
        ],
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
            zoom: 18);

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
        zoom: 18);
    googleMapController!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }
}

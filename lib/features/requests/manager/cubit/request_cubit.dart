import 'package:fixer/core/location/location_services.dart';
import 'package:fixer/core/networks/errors/error_snackbar.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
part 'request_state.dart';

class RequestCubit extends Cubit<RequestState> {
  RequestCubit() : super(RequestInitial());

  LocationServices locationServices = LocationServices();

  static RequestCubit get(context) => BlocProvider.of(context);

  Set<Marker> markers = {};

  late CameraPosition cameraPosition;

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

  BitmapDescriptor? icon;

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
    emit(SetLocation());
  }

  void initMapStyle(context) async {
    var style = await DefaultAssetBundle.of(context)
        .loadString("assets/maps_styles/app_styles.json");
    googleMapController!.setMapStyle(style);
  }

  GoogleMapController? googleMapController;

  void setCameraPosition(LocationData currentLocation) {
    CameraPosition cameraPosition = CameraPosition(
        target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
        zoom: 16);
    googleMapController!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }
}

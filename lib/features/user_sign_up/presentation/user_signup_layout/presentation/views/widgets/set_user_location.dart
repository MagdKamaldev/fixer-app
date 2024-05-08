// ignore_for_file: deprecated_member_use
import 'package:fixer/core/networks/errors/error_snackbar.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/buttons/default_button.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:ui' as ui;

class SetUserLocation extends StatefulWidget {
  const SetUserLocation({super.key});

  @override
  State<SetUserLocation> createState() => _SetUserLocationState();
}

class _SetUserLocationState extends State<SetUserLocation> {
  late CameraPosition _initialCameraPosition;

  @override
  void initState() {
    location = Location();
    updateLocation(context);
    _initialCameraPosition = const CameraPosition(
        target: LatLng(29.959157296412783, 30.93926904564774), zoom: 18);
    initMarker();
    super.initState();
  }

  Future<Uint8List> getImageFromRawData(String image, double width) async {
    var imageData = await rootBundle.load(image);
    var codec = await ui.instantiateImageCodec(imageData.buffer.asUint8List(),
        targetWidth: width.toInt());
    var frameInfo = await codec.getNextFrame();
    return (await frameInfo.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  BitmapDescriptor? icon;

  void initMarker() async {
    BitmapDescriptor customMarkerIcon = BitmapDescriptor.fromBytes(
        await getImageFromRawData("assets/images/house.png", 150.sp));
    icon = customMarkerIcon;
  }

  Set<Marker> markers = {};

  late Location location;

  GoogleMapController? googleMapController;

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
          GoogleMap(
            markers: markers,
            onMapCreated: (controller) {
              googleMapController = controller;
              initMapStyle();
            },
            initialCameraPosition: _initialCameraPosition,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 20.sp, right: 100.sp, top: 20.sp, bottom: 20.sp),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: DefaultButton(
                    text: S.of(context).confirmLocation, onPressed: () {})),
          )
        ],
      ),
    );
  }

  Future<void> checkAndRequestLocationServices(context) async {
    bool isServicesEnabed = await location.serviceEnabled();

    if (!isServicesEnabed) {
      isServicesEnabed = await location.requestService();
      if (!isServicesEnabed) {
        showErrorSnackbar(context, S.of(context).locationServicesDisabled);
      }
    }
  }

  Future<bool> checkAndRequestLocationPermission(context) async {
    var permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        showErrorSnackbar(context, S.of(context).locationPermissionDenied);
      }
    }
    return permissionStatus == PermissionStatus.granted;
  }

  void getLocationData() {
    location.changeSettings(distanceFilter: 5, interval: 10000);

    location.onLocationChanged.listen((LocationData currentLocation) {
      CameraPosition cameraPosition = CameraPosition(
          target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
          zoom: 18);

      Marker myLocationMarker = Marker(
        markerId: const MarkerId("myLocation"),
        position: LatLng(currentLocation.latitude!, currentLocation.longitude!),
        icon: icon!,
        infoWindow: const InfoWindow(title: "My Location"),
      );

      markers.add(myLocationMarker);
      setState(() {});
      googleMapController!
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    });
  }

  void updateLocation(context) async {
    await checkAndRequestLocationServices(context);
    bool hasPermission = await checkAndRequestLocationPermission(context);
    if (hasPermission) {
      getLocationData();
    } else {
      showErrorSnackbar(context, S.of(context).locationPermissionDenied);
    }
  }
}

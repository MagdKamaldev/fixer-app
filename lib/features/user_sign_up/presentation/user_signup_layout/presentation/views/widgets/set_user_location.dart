// ignore_for_file: deprecated_member_use

import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/buttons/default_button.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SetUserLocation extends StatefulWidget {
  const SetUserLocation({super.key});

  @override
  State<SetUserLocation> createState() => _SetUserLocationState();
}

class _SetUserLocationState extends State<SetUserLocation> {
  late CameraPosition _initialCameraPosition;

  @override
  void initState() {
    _initialCameraPosition = const CameraPosition(
        target: LatLng(29.959157296412783, 30.93926904564774), zoom: 16);
    initMarker();
    super.initState();
  }

  void initMarker() {
    Marker marker = const Marker(
      markerId: MarkerId("home"),
      position: LatLng(29.959157296412783, 30.93926904564774),
    );
    markers.add(marker);
  }

  Set<Marker> markers = {};

  late GoogleMapController _googleMapController;
  void initMapStyle() async {
    var style = await DefaultAssetBundle.of(context)
        .loadString("assets/maps_styles/app_styles.json");
    _googleMapController.setMapStyle(style);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).setHomeLocation,
          style: TextStyles.headings,
        ),
        toolbarHeight: 60.h,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GoogleMap(
            markers: markers,
            onMapCreated: (controller) {
              _googleMapController = controller;
              initMapStyle();
            },
            initialCameraPosition: _initialCameraPosition,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            cameraTargetBounds:
                //Egypt bounds
                CameraTargetBounds(
              LatLngBounds(
                southwest: const LatLng(22.0, 25.0),
                northeast: const LatLng(31.0, 35.0),
              ),
            ),
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
}

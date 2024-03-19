import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition _initialCameraPosition;

  @override
  void initState() {
    _initialCameraPosition = const CameraPosition(
        target: LatLng(29.959157296412783, 30.93926904564774), zoom: 13);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _initialCameraPosition,
      zoomControlsEnabled: false,
      zoomGesturesEnabled: false,
      cameraTargetBounds:
          //Egypt bounds
          CameraTargetBounds(
        LatLngBounds(
          southwest: const LatLng(22.0, 25.0),
          northeast: const LatLng(31.0, 35.0),
        ),
      ),
    );
  }
}

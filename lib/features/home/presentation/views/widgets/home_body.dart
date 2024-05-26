// ignore_for_file: deprecated_member_use

import 'package:fixer/features/home/presentation/services/home_location_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late CameraPosition initialCameraPosition;
  late HomeLocationService locationServices;

  GoogleMapController? googleMapController;

  void initMapStyle() async {
    var style = await DefaultAssetBundle.of(context)
        .loadString("assets/maps_styles/app_styles.json");
    googleMapController!.setMapStyle(style);
  }

  @override
  void initState() {
    super.initState();
    locationServices = HomeLocationService();
    initialCameraPosition = const CameraPosition(
        target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.4746);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (controller) {
        googleMapController = controller;
        initMapStyle();
      },
      initialCameraPosition: initialCameraPosition,
    );
  }
}

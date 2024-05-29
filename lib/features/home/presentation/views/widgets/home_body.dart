// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  static const LatLng home = LatLng(29.959340, 30.941488);
  static const LatLng office = LatLng(29.960141, 30.941797);

  List<LatLng> polylineCoordinates = [];

  @override
  void initState() {
    super.initState();
    getPolyPoints();
  }

  void getPolyPoints() async {
    String apiKey = 'AIzaSyDZDqr8Va2drRaWXkCJyddm6BwfmEXJyRgAIzaSyDZDqr8Va2drRaWXkCJyddm6BwfmEXJyRg';
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      apiKey,
      PointLatLng(home.latitude, home.longitude),
      PointLatLng(office.latitude, office.longitude),
    );

    if (result.points.isNotEmpty) {
      print("Points found: ${result.points.length}");
      polylineCoordinates.clear();
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      setState(() {});
    } else {
      print("No points found: ${result.errorMessage}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng((home.latitude + office.latitude) / 2,
              (home.longitude + office.longitude) / 2),
          zoom: 15,
        ),
        polylines: {
          Polyline(
            polylineId: const PolylineId('poly'),
            points: polylineCoordinates,
          ),
        },
        markers: {
          const Marker(markerId: MarkerId('home'), position: home),
          const Marker(markerId: MarkerId('office'), position: office),
        },
      ),
    );
  }
}

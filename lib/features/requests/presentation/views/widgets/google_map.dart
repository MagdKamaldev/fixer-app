// ignore_for_file: deprecated_member_use
import 'package:fixer/core/location/location_services.dart';
import 'package:fixer/core/networks/errors/error_snackbar.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/buttons/default_button.dart';
import 'package:fixer/features/requests/manager/cubit/request_cubit.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

String orderLocation = "";

class GoogleMapView extends StatefulWidget {
  const GoogleMapView({super.key});

  @override
  State<GoogleMapView> createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestCubit()..updateLocation(context),
      child: BlocBuilder<RequestCubit, RequestState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).location, style: TextStyles.bodybold),
            toolbarHeight: 60.h,
            centerTitle: true,
          ),
          body: Stack(
            children: [
              if (RequestCubit.get(context).markers.isEmpty)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              if (RequestCubit.get(context).markers.isNotEmpty &&
                  RequestCubit.get(context)
                          .locationServices
                          .isPermissionGranted ==
                      true)
                GoogleMap(
                  myLocationButtonEnabled: true,
                  onTap: (LatLng latLng) async {
                    RequestCubit.get(context).markers.clear();
                    RequestCubit.get(context).markers.add(Marker(
                          onTap: () => showErrorSnackbar(
                            context,
                            "Long press to move",
                          ),
                          markerId: const MarkerId('userLocationMarker'),
                          position: latLng,
                          draggable: true,
                          onDragEnd: (LatLng t) {},
                          icon: RequestCubit.get(context).icon ??
                              await BitmapDescriptor.fromAssetImage(
                                ImageConfiguration.empty,
                                "assets/images/house.png",
                              ),
                        ));

                    setState(() {});
                  },
                  markers: RequestCubit.get(context).markers,
                  onMapCreated: (controller) {
                    RequestCubit.get(context).googleMapController = controller;
                    RequestCubit.get(context).initMapStyle(context);
                  },
                  initialCameraPosition:
                      RequestCubit.get(context).cameraPosition,
                  zoomControlsEnabled: true,
                  zoomGesturesEnabled: true,
                ),
              if (RequestCubit.get(context).markers.isNotEmpty &&
                  RequestCubit.get(context)
                          .locationServices
                          .isPermissionGranted ==
                      true)
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
                              RequestCubit.get(context)
                                  .markers
                                  .first
                                  .position
                                  .latitude,
                              RequestCubit.get(context)
                                  .markers
                                  .first
                                  .position
                                  .longitude,
                            );
                            setState(() {
                              orderLocation =
                                  placemarks.first.subAdministrativeArea!;
                            });
                          })),
                )
            ],
          ),
        ),
      ),
    );
  }
}

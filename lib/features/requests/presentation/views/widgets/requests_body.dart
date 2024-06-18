import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/features/requests/presentation/views/widgets/confirm_request_container.dart';
import 'package:fixer/features/requests/presentation/views/widgets/google_map.dart';
import 'package:fixer/features/services/data/models/service_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestBody extends StatelessWidget {
  final int id;
  final ServiceModel service;
  const RequestBody({super.key, required this.id, required this.service});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        const GoogleMapView(),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 320.h,
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child:  ConfirmRequestConatiner(id: id,service: service,),
        )
      ],
    );
  }
}

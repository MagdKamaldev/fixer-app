import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/services/data/models/service_model.dart';
import 'package:fixer/features/services/presentation/view/widgets/popup_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesContainermodel extends StatelessWidget {
  final ServiceModel service;
  final int id;
  const ServicesContainermodel(
      {super.key, required this.id, required this.service});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return PopUpMessage(
              id: id,
              service: service,
            );
          },
        );
      },
      child: IntrinsicWidth(
        child: Container(
          height: 50.h,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: ColorManager.lightblue),
            boxShadow: const [
              BoxShadow(
                color: ColorManager.babyblue,
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(service.name!,
                  style: TextStyles.body.copyWith(color: ColorManager.primary)),
              horizontalSpace(10),
              Text(
                "${service.price} LE",
                style: TextStyles.small.copyWith(color: ColorManager.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}

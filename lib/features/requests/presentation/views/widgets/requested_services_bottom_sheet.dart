import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/requests/presentation/views/widgets/requested_services_model.dart';
import 'package:fixer/features/services/manager/cubit/services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestedServicesBottomSheet extends StatelessWidget {
  const RequestedServicesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 234.h,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorManager.black,
                    size: 25,
                  )),
              horizontalSpace(75),
              Text(
                "Requested service",
                style: TextStyles.bodybold.copyWith(color: ColorManager.black),
              )
            ],
          ),
          verticalSpace(24),
          Expanded(
              child: ListView.builder(
            itemCount: selected.length,
            itemBuilder: (context, index) {
              return RequestedServicesmodel(
                service: selected[index],
              );
            },
          ))
        ],
      ),
    );
  }
}

import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/services/data/models/service_model.dart';
import 'package:fixer/features/services/manager/cubit/services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestedServicesmodel extends StatefulWidget {
  final ServiceModel service;
  const RequestedServicesmodel({super.key, required this.service});

  @override
  State<RequestedServicesmodel> createState() => _RequestedServicesmodelState();
}

class _RequestedServicesmodelState extends State<RequestedServicesmodel> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        setState(() {
          selected.remove(widget.service);
          Navigator.pop(context);
          if (selected.isEmpty) {
            Navigator.pop(context);
          }
        });
      },
      child: Container(
        width: 380.w,
        height: 45.h,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.category_outlined,
              size: 25,
              color: ColorManager.primary,
            ),
            horizontalSpace(10),
            Text(
              widget.service.name!,
              style: TextStyles.bodybold.copyWith(color: ColorManager.black),
            ),
            const Spacer(),
            IconButton(
              icon: Icon(
                Icons.close_rounded,
                size: 25.sp,
              ),
              color: ColorManager.primary,
              onPressed: () {
                setState(() {
                  selected.remove(widget.service);
                  Navigator.pop(context);
                  if (selected.isEmpty) {
                    Navigator.pop(context);
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Arrow extends StatelessWidget {
  const Arrow({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.sp),
        alignment: locale == "en" ? Alignment.bottomRight : Alignment.topLeft,
        child: Container(
            width: 71.w,
            height: 71.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManager.primary,
            ),
            child: Icon(
              Icons.arrow_forward,
              color: ColorManager.white,
              size: 30.w,
            )),
      ),
    );
  }
}

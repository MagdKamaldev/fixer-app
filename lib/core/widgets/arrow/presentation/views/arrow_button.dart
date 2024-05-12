import 'package:fixer/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableArrowButton extends StatelessWidget {
  final Function() onPressed;
  const ReusableArrowButton(
      {super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
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
    );
  }
}

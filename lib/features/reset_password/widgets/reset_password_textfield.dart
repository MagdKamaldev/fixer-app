import 'package:fixer/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';

class ResetPasswordTextField extends StatelessWidget {
  const ResetPasswordTextField(
      {super.key,
      required this.controller,
      required this.text,
      required this.textInputType,
      required this.obscure,
      required this.icon});
  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscure;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        width: 385.w,
        height: 50.h,
        child: TextFormField(
            controller: controller,
            keyboardType: textInputType,
            obscureText: obscure,
            style: TextStyles.small,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: text,
                suffixIcon: icon,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                    borderSide:
                        const BorderSide(width: 1, color: ColorManager.black)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                    borderSide: const BorderSide(
                        width: 1, color: ColorManager.black)))));
  }
}

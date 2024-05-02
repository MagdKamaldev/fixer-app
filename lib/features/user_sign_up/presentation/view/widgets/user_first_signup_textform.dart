import 'package:fixer/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserSignUpTextForm extends StatelessWidget {
  const UserSignUpTextForm(
      {super.key,
      required this.controller,
      required this.text,
      required this.textInputType,
      required this.obscure,
      this.icon,
      required this.validate});
  final Function validate;
  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscure;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55.h,
        width: 340.w,
        padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 15.w),
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorManager.primary)),
        child: TextFormField(
          validator: (value) {
            return validate(value);
          },
          controller: controller,
          keyboardType: textInputType,
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: text,
            suffix: icon,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            // disabledBorder: const UnderlineInputBorder()
          ),
        ));
  }
}

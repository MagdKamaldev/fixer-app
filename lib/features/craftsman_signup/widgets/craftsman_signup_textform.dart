import 'package:fixer/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CraftsmanSignUpTextForm extends StatelessWidget {
  const CraftsmanSignUpTextForm({
    super.key,
    required this.controller,
    required this.text,
    required this.textInputType,
  });
  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        width: 340,
        padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 15.w),
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorManager.primary)),
        child: TextFormField(
          controller: controller,
          keyboardType: textInputType,
          decoration: InputDecoration(
              hintText: text, disabledBorder: UnderlineInputBorder()),
        ));
  }
}

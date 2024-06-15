// ignore_for_file: body_might_complete_normally_nullable

import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fixer/core/themes/colors.dart';

class LargeTextForm extends StatelessWidget {
  const LargeTextForm({
    super.key,
    required this.controller,
    required this.text,
    required this.textInputType,
    required this.obscure,
    this.icon,
  });

  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscure;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h, // Increased height
      width: 340, // Increased width
      padding: EdgeInsets.symmetric(
          vertical: 10.h, horizontal: 20.w), // Adjusted padding
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius:
            BorderRadius.circular(15), // Slightly larger border radius
        border: Border.all(color: ColorManager.primary),
      ),
      child: TextFormField(
        validator: (String? value) {
          if (value!.isEmpty) {
            return S.of(context).emptyValidation;
          }
        },
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscure,
        decoration: InputDecoration(
          suffixIcon: icon,
          hintText: text,
          hintStyle: TextStyle(
            fontSize: 20.sp, // Increased font size for hint text
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(0, 31, 24, 24)),
          ),
        ),
        style: TextStyle(
          fontSize: 24.sp, // Increased font size for input text
        ),
      ),
    );
  }
}

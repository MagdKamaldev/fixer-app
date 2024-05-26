import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextForm extends StatelessWidget {
  const TextForm({
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
        height: 55,
        width: 340,
        padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 15.w),
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorManager.primary)),
        child: TextFormField(
          validator: (String ? value) {
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
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(0, 31, 24, 24)),
            ),
          ),
        ));
  }
}

import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressTextFieldModel extends StatelessWidget {
  final String labeltext;
  final Widget icons;
  final double width;
  final TextEditingController controller;
  const AddressTextFieldModel(
      {super.key,
      required this.width,
      required this.labeltext,
      required this.icons,
      required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.h),
      height: 55.h,
      width: width.w,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return S.of(context).emptyValidation;
          }
          return null;
        },
        controller: controller,
        keyboardType: TextInputType.text,
        textAlign: TextAlign.start,
        style: TextStyles.small,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: icons,
            prefixIconColor: ColorManager.grey,
            labelText: labeltext,
            labelStyle: TextStyles.small.copyWith(color: ColorManager.grey),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            alignLabelWithHint: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.sp, color: ColorManager.grey)),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1.sp, color: ColorManager.grey),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              width: 1.sp,
              color: ColorManager.grey,
            ))),
      ),
    );
  }
}

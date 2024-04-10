import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressTextFieldModel extends StatelessWidget {
  final String labeltext;
  final Widget icons;
  final double width;
  const AddressTextFieldModel(
      {super.key,
      required this.width,
      required this.labeltext,
      required this.icons});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      height: 55.h,
      width: width.w,
      child: TextFormField(
        // controller: ,
        keyboardType: TextInputType.text,
        textAlign: TextAlign.start,
        style: TextStyles.small,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            // hintText: hinttext,
            prefixIcon: icons,
            prefixIconColor: ColorManager.grey,
            labelText: labeltext,
            labelStyle: TextStyles.small.copyWith(color: ColorManager.grey),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            alignLabelWithHint: true,
            focusedBorder: const OutlineInputBorder(
              borderSide:
                    BorderSide(width: 1, color: ColorManager.grey)),
            border: const OutlineInputBorder(
              borderSide: 
                    BorderSide(width: 1, color: ColorManager.grey),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: 
                   BorderSide(color: ColorManager.grey,width: 1)
            )
            ),
      ),
    );
  }
}

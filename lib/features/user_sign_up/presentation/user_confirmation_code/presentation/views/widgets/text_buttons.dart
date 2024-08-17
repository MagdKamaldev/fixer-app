import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResendTextButton extends StatelessWidget {
  final Function()? onTap;
  const ResendTextButton({super.key, required this.text, this.onTap});
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(text,
          style: TextStyles.bodybold.copyWith(
            color: ColorManager.grey,
            decoration: TextDecoration.underline,
            decorationColor: ColorManager.grey,
            decorationThickness: 2.sp,
          )),
    );
  }
}

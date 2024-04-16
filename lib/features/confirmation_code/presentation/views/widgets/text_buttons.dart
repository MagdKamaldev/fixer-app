import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResendTextButton extends StatelessWidget {
  const ResendTextButton({super.key,required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child:Text(text,
                style: TextStyles.bodybold.copyWith(
                  color: ColorManager.grey,
                  decoration: TextDecoration.underline,
                    decorationColor: ColorManager.grey, 
                    decorationThickness: 2.sp,
                )), 
    );
  }
}
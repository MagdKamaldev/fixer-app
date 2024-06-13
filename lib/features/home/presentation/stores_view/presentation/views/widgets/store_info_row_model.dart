import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreInfoRowModel extends StatelessWidget {
  final String labeltext;
  final String? labelInfo;
  final IconData icon;
  const StoreInfoRowModel({super.key, required this.labeltext, this.labelInfo, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
            horizontalSpace(20),
            Icon(icon,size: 25.sp,color: ColorManager.primary,),
            horizontalSpace(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(labeltext,style: TextStyles.smallbold.copyWith(color: ColorManager.primary)),
              if (labelInfo != null)
              Text(labelInfo!,style: TextStyles.small.copyWith(color: ColorManager.primary),)
            ],)
          ],);
  }
}
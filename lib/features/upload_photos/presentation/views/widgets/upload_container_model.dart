import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadConatiner extends StatelessWidget {
  final String text;
  const UploadConatiner({super.key,required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.h,
      width: 340.w,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(bottom:BorderSide(color: ColorManager.black,width: 1))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
          style: TextStyles.body,
          ),
          const Icon(Icons.arrow_forward_ios_outlined,
          color: ColorManager.grey,size: 25,)
        ],
      ),
    );
  }
}
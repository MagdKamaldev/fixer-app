import 'package:fixer/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ServicesContainerModel extends StatelessWidget {
  final String image;
  const ServicesContainerModel({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 109.w,
          height: 95.h,
          decoration: BoxDecoration(
            border: Border.all(color: ColorManager.lightblue,width: 1,),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SvgPicture.asset(image,width: 99.w,height: 100.h,)
      ],
    );
  }
}
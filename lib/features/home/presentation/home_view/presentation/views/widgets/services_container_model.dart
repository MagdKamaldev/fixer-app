import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ServicesContainerModel extends StatelessWidget {
  final String image;
  const ServicesContainerModel({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
        // border: Border.all(color: ColorManager.lightblue,width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SvgPicture.asset(image,),
    );
  }
}
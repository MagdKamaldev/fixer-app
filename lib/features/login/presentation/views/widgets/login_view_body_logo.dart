// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(children: [
        SvgPicture.asset(
          "assets/images/Group_22.svg",
          width: 125.w,
          height: 89.h,
        ),
        Padding(
            padding: EdgeInsets.only(top: 25.h),
            child: SvgPicture.asset("assets/images/fixr_logo.svg",
                width: 134.85.w, height: 56.92.h))
      ]),
    ]);
  }
}

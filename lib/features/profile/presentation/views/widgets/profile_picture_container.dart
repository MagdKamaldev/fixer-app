import 'package:fixer/core/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePictureContainer extends StatelessWidget {
  final String image;
  const ProfilePictureContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125.w,
      height: 130.h,
      margin: EdgeInsets.only(top: 75.h),
      decoration: BoxDecoration(
          color: ColorManager.grey,
          borderRadius: BorderRadius.circular(60.sp),
          image: image != ""
              ? DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)
              : const DecorationImage(
                  image: AssetImage(
                    "assets/images/profile_photo.png",
                  ),
                  fit: BoxFit.contain),
          border: Border.all(width: 3, color: ColorManager.white)),
    );
  }
}

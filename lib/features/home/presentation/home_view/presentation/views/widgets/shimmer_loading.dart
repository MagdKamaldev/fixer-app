import 'package:fixer/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:5, // Example count, adjust as needed
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: ColorManager.primary,
          highlightColor: ColorManager.primary.withOpacity(0.6),
          child: Container(
            width: 350.w,
            height: 96.h,
            margin: const EdgeInsets.symmetric(horizontal:10,vertical:4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }
}

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
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: double.infinity,
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        );
      },
    );
  }
}

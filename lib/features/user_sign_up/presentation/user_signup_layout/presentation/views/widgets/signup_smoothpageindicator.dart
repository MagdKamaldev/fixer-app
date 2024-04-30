import 'package:fixer/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothIndicatorUserSignup extends StatelessWidget {
  final PageController controller;
  const SmoothIndicatorUserSignup({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: ExpandingDotsEffect(
        dotHeight: 10.h,
        dotWidth: 10.w,
        activeDotColor: ColorManager.primary,
        dotColor: ColorManager.grey,
      ),
    );
  }
}

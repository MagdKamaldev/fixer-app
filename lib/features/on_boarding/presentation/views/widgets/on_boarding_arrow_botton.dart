import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingArrow extends StatelessWidget {
  final PageController controller;
  final bool onlastPage;
  const OnBoardingArrow(
      {super.key, required this.controller, required this.onlastPage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onlastPage
            ? context.pushReplacementNamed(Routes.login)
            : controller.nextPage(
                duration: const Duration(microseconds: 500),
                curve: Curves.easeIn);
      },
      child: Container(
          width: 71.w,
          height: 71.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorManager.primary,
          ),
          child: Icon(
            Icons.arrow_forward,
            color: ColorManager.white,
            size: 30.w,
          )),
    );
  }
}

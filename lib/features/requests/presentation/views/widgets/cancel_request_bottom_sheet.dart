import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CancelRequestBottomSheet extends StatelessWidget {
  const CancelRequestBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 42),
      decoration: const BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/uncovered_area.svg",
            height: 120.h,
            width: 177.w,
          ),
          verticalSpace(30),
          Text(
            "Sorry ,We don’t Cover this area",
            style: TextStyles.bodybold,
          ),
          verticalSpace(30),
          Row(
            children: [
              MaterialButton(
                onPressed: () {
                  context.pushReplacementNamed(Routes.home);
                },
                color: ColorManager.primary,
                height: 50.h,
                minWidth: 150.w,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "cancel request",
                  style: TextStyles.body.copyWith(color: ColorManager.white),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  context.pushNamed(Routes.availablecraftmen);
                },
                color: ColorManager.primary,
                height: 50.h,
                minWidth: 150.w,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "text button ",
                  style: TextStyles.body.copyWith(color: ColorManager.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

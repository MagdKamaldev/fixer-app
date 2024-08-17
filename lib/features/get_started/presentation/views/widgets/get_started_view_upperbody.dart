import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UpperBody extends StatelessWidget {
  const UpperBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        // margin: const EdgeInsets.symmetric(horizontal: 43),
        child: SvgPicture.asset(
          "assets/images/Group 33.svg",
          width: 263.w,
          height: 249.h,
        ),
      ),
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40.h, vertical: 25.w),
          child: SvgPicture.asset("assets/images/fixr_logo.svg",
              width: 180.w, height: 76.h),
        ),
        Text(S.of(context).slogan,
            textAlign: TextAlign.center, style: TextStyles.lightHeadings),
        verticalSpace(40),
        Text(S.of(context).getstartintro,
            textAlign: TextAlign.center, style: TextStyles.smallHeadings)
      ]),
    ]);
  }
}

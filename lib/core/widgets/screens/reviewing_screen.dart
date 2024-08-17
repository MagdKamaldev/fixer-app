import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ReviewingBody extends StatelessWidget {
  const ReviewingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.sp),
      child: Column(
        children: [
          verticalSpace(50),
          Lottie.asset('assets/animations/done.json'),
          verticalSpace(20),
          Text(
            S.of(context).reviewingApp,
            style: TextStyles.headings,
          ),
        ],
      ),
    );
  }
}

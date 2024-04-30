import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/buttons/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:fixer/generated/l10n.dart';

class DoneAnimation extends StatelessWidget {
  const DoneAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.sp),
      child: Column(
        children: [
          Text(
            S.of(context).doneField,
            style: TextStyles.headings,
          ),
          verticalSpace(20.h),
          Lottie.asset("assets/animations/done.json"),
          verticalSpace(20.h),
          DefaultButton(text: S.of(context).edit, onPressed: () {}),
        ],
      ),
    );
  }
}

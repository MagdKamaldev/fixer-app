import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/routing/routes.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartButtons extends StatelessWidget {
  const StartButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Column(
        children: [
          Text(
            S.of(context).getstart,
            style: TextStyles.darksmallHeadings,
          ),
          verticalSpace(25),
          ElevatedButton(
            onPressed: () {
              context.pushNamed(Routes.userSignUp);
            },
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: ColorManager.primary,
                minimumSize: Size.fromHeight(55.h)),
            child: Text(
              S.of(context).signup_user,
              style: TextStyles.whitesmallHeadings,
            ),
          ),
          verticalSpace(25),
          ElevatedButton(
            onPressed: () {
              context.pushNamed(Routes.craftsmanSignUp);
            },
            style: ElevatedButton.styleFrom(
                side: const BorderSide(color: ColorManager.primary),
                shape: const StadiumBorder(),
                backgroundColor: ColorManager.white,
                minimumSize: Size.fromHeight(55.h)),
            child: Text(
              S.of(context).signup_craft,
              style: TextStyles.primarysmallHeadings,
            ),
          ),
        ],
      ),
    );
  }
}

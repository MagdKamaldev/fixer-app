import 'package:fixer/core/routing/app_router.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/user_sign_up/presentation/terms_and_conditions/terms_and_conditions.dart';
import 'package:fixer/features/user_sign_up/presentation/view/widgets/user_signup_body.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserTermsandPolicy extends StatefulWidget {
  const UserTermsandPolicy({super.key});

  @override
  State<UserTermsandPolicy> createState() => _TermsandPolicyState();
}

class _TermsandPolicyState extends State<UserTermsandPolicy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        children: [
          Checkbox(
            value: isAgreed,
            onChanged: (bool? selection) {
              setState(() {
                isAgreed = !isAgreed;
              });
            },
            checkColor: ColorManager.primary,
            activeColor: ColorManager.white,
            focusColor: ColorManager.black,
          ),
          Text(S.of(context).agree, style: TextStyles.smallbold),
          GestureDetector(
              onTap: () {
                navigateTo(context, const TermsAndConditionsPage());
              },
              child: Text(S.of(context).termsandpolicy,
                  style: TextStyles.smallbold.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: ColorManager.black,
                      decorationThickness: 2.sp))),
        ],
      ),
    );
  }
}

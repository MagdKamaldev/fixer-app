import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15.w),
        child: Row(children: [
          Checkbox(
            value: isSelected,
            onChanged: (bool? selection) {
              setState(() {
                isSelected = !isSelected;
              });
            },
            checkColor: ColorManager.primary,
            activeColor: ColorManager.white,
            focusColor: ColorManager.black,
          ),
          Text(S.of(context).remember, style: TextStyles.smallbold),
          const Spacer(),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.forgetPassword);
              },
              child: Text(S.of(context).forgot, style: TextStyles.smallbold))
        ]));
  }
}

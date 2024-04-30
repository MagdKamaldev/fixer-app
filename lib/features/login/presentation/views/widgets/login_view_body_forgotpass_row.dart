import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';

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
        margin: locale == "en"
            ? const EdgeInsets.only(left: 15)
            : const EdgeInsets.only(right: 15),
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
          horizontalSpace(60),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.forgetPassword);
              },
              child: Text(S.of(context).forgot, style: TextStyles.smallbold))
        ]));
  }
}

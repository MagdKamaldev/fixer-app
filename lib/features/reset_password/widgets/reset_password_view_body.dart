import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_logo.dart';
import 'package:fixer/features/reset_password/widgets/reset_button.dart';
import 'package:fixer/features/reset_password/widgets/reset_password_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/themes/text_styles.dart';
import '../../../generated/l10n.dart';

class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({super.key});

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  final TextEditingController passwordnew = TextEditingController();
  final TextEditingController passwordconfirmation = TextEditingController();
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      verticalSpace(50),
      const Logo(),
      verticalSpace(25),
      Text(
        S.of(context).resetpassword,
        style: TextStyles.headings,
      ),
      verticalSpace(40),
      Padding(
          padding: locale == "en"
              ? const EdgeInsets.only(right: 190)
              : const EdgeInsets.only(left: 230),
          child: Text(
            S.of(context).newpassword,
            style: TextStyles.bodybold,
          )),
      verticalSpace(5),
      ResetPasswordTextField(
        controller: passwordnew,
        text: S.of(context).newpasswordfield,
        textInputType: TextInputType.text,
        obscure: obscure,
        icon: GestureDetector(
          onTap: () {
            setState(() {
              obscure = !obscure;
            });
          },
          child: setpasswordIcon(),
        ),
      ),
      verticalSpace(25),
      Padding(
          padding: locale == "en"
              ? const EdgeInsets.only(right: 190)
              : const EdgeInsets.only(left: 230),
          child: Text(
            S.of(context).Confirmnewpassword,
            style: TextStyles.bodybold,
          )),
      verticalSpace(5),
      ResetPasswordTextField(
          textInputType: TextInputType.text,
          obscure: obscure,
          controller: passwordconfirmation,
          text: S.of(context).Confirmnewpasswordfield,
          icon: GestureDetector(
            onTap: () {
              setState(() {
                obscure = !obscure;
              });
            },
            child: setpasswordIcon(),
          )),
      verticalSpace(30),
      const ResetButtton()
    ]);
  }

  Icon setpasswordIcon() {
    if (obscure) {
      return const Icon(
        Icons.visibility,
        size: 24,
      );
    } else {
      return const Icon(Icons.visibility_off, size: 24);
    }
  }
}

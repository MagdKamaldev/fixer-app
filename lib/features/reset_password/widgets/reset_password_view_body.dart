import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_logo.dart';
import 'package:fixer/features/reset_password/widgets/reset_button.dart';
import 'package:fixer/features/reset_password/widgets/reset_password_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return ListView(
      children:[ Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        const Logo(),
        verticalSpace(25),
        Text(
          S.of(context).resetpassword,
          style: TextStyles.headings,
        ),
        verticalSpace(40),
        Padding(
            padding: locale == "en"
                ?  EdgeInsets.only(right: 220.w)
                :  EdgeInsets.only(left: 210.w),
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
                ?  EdgeInsets.only(right: 160.w)
                :  EdgeInsets.only(left: 170.w),
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
      ]),
    ]);
  }

  Icon setpasswordIcon() {
    if (obscure) {
      return Icon(
        Icons.visibility,
        size: 24.sp,
      );
    } else {
      return Icon(Icons.visibility_off, size: 24.sp);
    }
  }
}

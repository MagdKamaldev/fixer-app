import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_text_container.dart';
import 'package:fixer/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_buttons.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_forgotpass_row.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_logo.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_text_forms.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(children: [
        verticalSpace(50),
        const Logo(),
        verticalSpace(25),
        Text(S.of(context).welcome,
            textAlign: TextAlign.center, style: TextStyles.headings),
        verticalSpace(25),
        TextContainer(
          text: S.of(context).phone,
          margin: 35,
        ),
        verticalSpace(10),
        //EMAIL INPUT
        TextForm(
            controller: phoneController,
            text: S.of(context).enteryphonenumber,
            obscure: false,
            textInputType: TextInputType.phone),

        verticalSpace(30),
        TextContainer(
          text: S.of(context).password,
          margin: 35,
        ),
        verticalSpace(10),
        //PASSWORD INPUT
        TextForm(
          controller: passwordController,
          text: S.of(context).passwordform,
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
      ]),
      verticalSpace(5),
      const ForgotPassword(),
      verticalSpace(15),
      const ButtonLogin(),
      verticalSpace(15),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextContainer(
            text: S.of(context).noaccount,
            margin: 0,
          ),
          TextButton(
              onPressed: () {
                context.pushNamed(Routes.getStarted);
              },
              child: TextContainer(
                text: S.of(context).signup,
                color: ColorManager.primary,
                margin: 0,
              ))
        ],
      )
    ]);
  }

  Icon setpasswordIcon() {
    if (obscure) {
      return const Icon(Icons.visibility);
    } else {
      return const Icon(Icons.visibility_off);
    }
  }
}

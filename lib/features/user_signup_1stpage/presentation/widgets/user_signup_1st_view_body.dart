import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/routing/routes.dart';
import 'package:fixer/features/craftsman_signup/presentation/views/widgets/terms_and_policy_row.dart';
import 'package:fixer/features/user_signup_1stpage/presentation/user_first_signup_textform.dart';
import 'package:fixer/features/user_signup_1stpage/presentation/widgets/signup_buttons.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../login/presentation/views/widgets/login_view_body_text_container.dart';

class UserSignUpFirstBody extends StatefulWidget {
  const UserSignUpFirstBody({super.key});

  @override
  State<UserSignUpFirstBody> createState() => _UserSignUpFirstBodyState();
}

class _UserSignUpFirstBodyState extends State<UserSignUpFirstBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(children: [
        verticalSpace(20),
        TextContainer(text: S.of(context).fullname, margin: 35),
        verticalSpace(5),
        UserSignUpTextForm(
            obscure: false,
            controller: nameController,
            text: S.of(context).fullnamefield,
            textInputType: TextInputType.name),
        verticalSpace(15),
        TextContainer(text: S.of(context).email, margin: 35),
        verticalSpace(5),
        UserSignUpTextForm(
          obscure: false,
          controller: emailController,
          text: S.of(context).emailfield,
          textInputType: TextInputType.name,
        ),
        verticalSpace(15),
        TextContainer(text: S.of(context).password, margin: 35),
        verticalSpace(5),
        UserSignUpTextForm(
          obscure: obscure,
          controller: passwordController,
          text: S.of(context).passwordform,
          textInputType: TextInputType.text,
          icon: GestureDetector(
            onTap: () {
              setState(() {
                obscure = !obscure;
              });
            },
            child: setpasswordIcon(),
          ),
        ),
        verticalSpace(15),
        const TermsandPolicy(),
        verticalSpace(30),
        const ButtonSignUp(),
        verticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).alreadyhaveaccount,
              style: TextStyles.bodybold,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.login);
                },
                child: Text(
                  S.of(context).login,
                  style: TextStyles.primarytextbutton,
                ))
          ],
        )
      ]),
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

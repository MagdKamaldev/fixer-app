import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_text_container.dart';
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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(children: [
        verticalSpace(50),
        const Logo(),
        verticalSpace(25),
        const TextContainer(
          text: "Email",
          margin: 35,
        ),
        verticalSpace(10),
        //EMAIL INPUT
        TextForm(
            controller: emailController,
            text: "Enter your email",
            obscure: false,
            textInputType: TextInputType.emailAddress),

        verticalSpace(35),
        const TextContainer(
          text: "Password",
          margin: 35,
        ),
        verticalSpace(10),
        //PASSWORD INPUT
        TextForm(
          controller: passwordController,
          text: "Enter your password",
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
      verticalSpace(15),
      const ForgotPassword(),
      verticalSpace(20),
      const ButtonLogin(),
      verticalSpace(15),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextContainer(
            text: "Don’t have an account?",
            margin: 0,
          ),
          TextButton(
              onPressed: () {},
              child: const TextContainer(
                text: "Sign up",
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

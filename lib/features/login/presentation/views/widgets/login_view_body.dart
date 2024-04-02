import 'package:fixer/features/login/presentation/views/widgets/login_view_body_buttons.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_forgotpass_row.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_logo.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_text_forms';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(children: [
        const Logo(),
        const SizedBox(height: 25),
        Container(
          margin: const EdgeInsets.only(left: 35),
          alignment: Alignment.topLeft,
          child: Text("Email",
              textAlign: TextAlign.start,
              style: GoogleFonts.roboto(
                color: const Color(0xff1E1E1E),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
        ),
        const SizedBox(height: 10),
        //EMAIL INPUT
        TextForm(
            controller: emailController,
            text: "   Enter your email",
            obscure: false,
            textInputType: TextInputType.emailAddress),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.only(left: 35),
          alignment: Alignment.topLeft,
          child: Text("Password",
              textAlign: TextAlign.start,
              style: GoogleFonts.roboto(
                color: const Color(0xff1E1E1E),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
        ),
        const SizedBox(height: 10),
        //PASSWORD INPUT
        TextForm(
            controller: passwordController,
            text: "   Enter your password",
            textInputType: TextInputType.text,
            obscure: true),
        const SizedBox(height: 15),
        const ForgotPassword(),
        const SizedBox(height: 20),
        const ButtonLogin(),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don’t have an account?",
              style: GoogleFonts.roboto(
                  color: const Color(0xff000000),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            TextButton(
                onPressed: () {},
                child: Text("Sign up",
                    style: GoogleFonts.roboto(
                      color: const Color(0XFF303564),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )))
          ],
        )
      ]),
    ]);
  }
}

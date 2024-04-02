import 'package:fixer/features/login/presentation/views/widgets/login_view_body_textContainer.dart';
import 'package:flutter/material.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_buttons.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_forgotpass_row.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_logo.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_text_forms.dart';

class LoginViewBody extends StatefulWidget {
  LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscure=true;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(children: [
        const Logo(),
        const SizedBox(height: 25),
        textContainer(text: "Email",margin: 35,),
        const SizedBox(height: 10),
        //EMAIL INPUT
        TextForm(
            controller: emailController,
            text: "Enter your email",
            obscure: false,
            textInputType: TextInputType.emailAddress),
        const SizedBox(height: 20),
        textContainer(text: "Password",margin: 35,),
        const SizedBox(height: 10),
        //PASSWORD INPUT
        TextForm(controller: passwordController,
              text: "Enter your password",
              textInputType: TextInputType.text,
              obscure:obscure,
              icon: GestureDetector(
                onTap: () {
                  setState(() { obscure=!obscure; });
                },
                child: setpasswordIcon(),
              ),
              ), 
            ]),
        const SizedBox(height: 15),
        const ForgotPassword(),
        const SizedBox(height: 20),
        const ButtonLogin(),
        const SizedBox(height: 15),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textContainer(text:"Don’t have an account?",margin: 0,),
            TextButton(
                onPressed: () {},
                child: textContainer(text:"Sign up",
                color: const Color(0XFF303564),
                margin: 0,)
                )
          ],
        )
      ]);
  }
  Icon setpasswordIcon(){
  if(obscure){
    return const Icon(Icons.visibility);}
    else{
    return const Icon(Icons.visibility_off);
    }
  }
}


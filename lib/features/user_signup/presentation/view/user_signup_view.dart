import 'package:fixer/features/user_signup/presentation/view/widgets/user_signup_body.dart';
import 'package:flutter/material.dart';

class UserSignUpView extends StatelessWidget {
  final PageController? controller;
  const UserSignUpView({super.key,this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: UserSignUpFirstBody(controller: controller,));
  }
}

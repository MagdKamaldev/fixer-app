import 'package:fixer/features/user_signup/presentation/view/widgets/user_signup_body.dart';
import 'package:flutter/material.dart';

class UserSignUpView extends StatelessWidget {
  const UserSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: UserSignUpFirstBody());
  }
}

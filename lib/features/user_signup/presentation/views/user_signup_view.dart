import 'package:fixer/features/user_signup/presentation/views/widgets/user_signup_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserSignUpView extends StatelessWidget {
  const UserSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UserSignUpBody(),
    );
  }
}
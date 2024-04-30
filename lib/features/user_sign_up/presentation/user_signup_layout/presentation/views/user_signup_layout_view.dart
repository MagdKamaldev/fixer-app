import 'package:fixer/features/user_sign_up/presentation/user_signup_layout/presentation/views/widgets/user_signup_layout_body.dart';
import 'package:flutter/material.dart';

class UserSignUpView extends StatelessWidget {
  const UserSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: const UserSignUpBody(),
    );
  }
}
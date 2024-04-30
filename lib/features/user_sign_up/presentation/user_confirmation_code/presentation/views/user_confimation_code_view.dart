import 'package:fixer/features/user_sign_up/presentation/user_confirmation_code/presentation/views/widgets/user_confirmation_code_body.dart';
import 'package:flutter/material.dart';

class UserConfirmationCodeView extends StatelessWidget {
  // final PageController? controller;
  const UserConfirmationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const UserConfirmationCodeBody(),
    );
  }
}

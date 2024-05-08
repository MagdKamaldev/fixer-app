import 'package:fixer/features/user_sign_up/presentation/user_confirmation_code/presentation/views/widgets/user_confirmation_code_body.dart';
import 'package:flutter/material.dart';

class UserConfirmationCodeView extends StatelessWidget {
  // final PageController? controller;
  final String verificationId;
  const UserConfirmationCodeView({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: UserConfirmationCodeBody(
        verificationId: verificationId,
      ),
    );
  }
}

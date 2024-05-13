import 'package:fixer/features/craftsman_sign_up/presentation/craftsman_confirmation_code/presentation/views/widgets/craftsman_confirmation_code_body.dart';
import 'package:flutter/material.dart';

class CraftsmanConfirmationCodeView extends StatelessWidget {
  final String verificationId;
  const CraftsmanConfirmationCodeView(
      {super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CraftsmanConfirmationCodeBody(
        verificationId: verificationId,
      ),
    );
  }
}

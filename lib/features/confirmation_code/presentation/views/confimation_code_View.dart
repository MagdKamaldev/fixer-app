import 'package:fixer/features/confirmation_code/presentation/views/widgets/confirmation_code_body.dart';
import 'package:flutter/material.dart';

class confirmationCodeView extends StatelessWidget {
  const confirmationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(),
      body:const ConfirmationCodeBody(),
    );
  }
}
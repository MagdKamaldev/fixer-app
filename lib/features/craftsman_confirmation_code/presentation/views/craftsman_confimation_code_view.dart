import 'package:fixer/features/craftsman_confirmation_code/presentation/views/widgets/craftsman_confirmation_code_body.dart';
import 'package:flutter/material.dart';

class CraftsmanConfirmationCodeView extends StatelessWidget {
  const CraftsmanConfirmationCodeView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(),
      body:const CraftsmanConfirmationCodeBody(),
    );
  }
}
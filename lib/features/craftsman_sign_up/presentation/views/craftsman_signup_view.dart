import 'package:fixer/features/craftsman_sign_up/presentation/views/widgets/craftsman_signup_body.dart';
import 'package:flutter/material.dart';

class CraftsmanSignUpView extends StatelessWidget {
  const CraftsmanSignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: const CraftsmanSignUpViewBody());
  }
}

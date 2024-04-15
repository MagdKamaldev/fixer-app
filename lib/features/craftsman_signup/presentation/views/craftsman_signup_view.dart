import 'package:fixer/features/craftsman_signup/presentation/views/widgets/craftsman_signup_viewbody.dart';
import 'package:flutter/material.dart';

class CraftsmanSignUpView extends StatelessWidget {
  const CraftsmanSignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body:const CraftsmanSignUpViewBody()
      );
  }
}

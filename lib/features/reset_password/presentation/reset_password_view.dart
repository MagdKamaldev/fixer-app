import 'package:fixer/features/reset_password/presentation/widgets/reset_password_view_body.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ResetPasswordBody());
  }
}

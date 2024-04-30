import 'package:flutter/material.dart';

import 'forget_password_view_body.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ForgetPasswordBody());
  }
}

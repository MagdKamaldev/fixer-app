import 'package:fixer/features/craftsman_sign_up/presentation/fields_of_service/widgets/fields_view_body.dart';
import 'package:flutter/material.dart';

class FieldOfService extends StatelessWidget {
  final String name;
  final String userName;
  final String email;
  const FieldOfService(
      {super.key,
      required this.name,
      required this.userName,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FieldOfServiceBody(
          name: name,
          userName: userName,
          email: email,
        ));
  }
}

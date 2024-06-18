import 'package:fixer/features/requests/presentation/views/widgets/requests_body.dart';
import 'package:flutter/material.dart';

class RequestView extends StatelessWidget {
  const RequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RequestBody(),
    );
  }
}
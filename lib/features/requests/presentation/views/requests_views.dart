import 'package:fixer/features/requests/presentation/views/widgets/requests_body.dart';
import 'package:flutter/material.dart';

class RequestView extends StatelessWidget {
  final int id;
  const RequestView({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RequestBody(
        id: id,
      ),
    );
  }
}

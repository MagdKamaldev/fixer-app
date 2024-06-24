import 'package:fixer/features/requests/presentation/views/widgets/requests_body.dart';
import 'package:flutter/material.dart';

class RequestView extends StatelessWidget {
  final int id;
  final String additional;
  const RequestView({
    super.key,
    required this.id, required this.additional,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RequestBody(
        additional: additional,
        id: id,
      ),
    );
  }
}

import 'package:fixer/features/requests/presentation/views/widgets/requests_body.dart';
import 'package:fixer/features/services/data/models/service_model.dart';
import 'package:flutter/material.dart';

class RequestView extends StatelessWidget {
  final int id;
  final ServiceModel service;
  const RequestView({super.key, required this.id, required this.service});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: RequestBody(id: id,service: service,),
    );
  }
}

import 'package:fixer/features/services/data/models/service_model.dart';
import 'package:fixer/features/services/presentation/view/widgets/services_container_model.dart';
import 'package:flutter/material.dart';

class ServicesWrapRow extends StatelessWidget {
  final List<ServiceModel> services;
  final int id;
  final String additional;
  final GlobalKey<FormState> formKey;
  const ServicesWrapRow(
      {super.key,
      required this.services,
      required this.id,
      required this.additional,
     required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      alignment: WrapAlignment.start,
      children: services
          .map((service) => ServicesContainermodel(
               formKey: formKey,
                additionnal: additional,
                id: id,
                service: service,
              ))
          .toList(),
    );
  }
}

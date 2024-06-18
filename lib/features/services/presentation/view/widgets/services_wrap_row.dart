import 'package:fixer/features/services/data/models/service_model.dart';
import 'package:fixer/features/services/presentation/view/widgets/services_container_model.dart';
import 'package:flutter/material.dart';

class ServicesWrapRow extends StatelessWidget {
  final List<ServiceModel> services;
  final int id;
  const ServicesWrapRow({super.key, required this.services, required this.id});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      alignment: WrapAlignment.start,
      children: services
          .map((service) => ServicesContainermodel(
            id: id,
                service: service,
              ))
          .toList(),
    );
  }
}

import 'package:fixer/features/services/presentation/view/widgets/services_container_model.dart';
import 'package:flutter/material.dart';

class ServicesWrapRow extends StatelessWidget {
  ServicesWrapRow({super.key});
  
  final List<String> items = [
    'water supply',
    'drain & swwer',
    'pipe replacement',
    'gas lines',
    'leak repair',
    'water heaters',
    'maintainace',
  ];

  @override
  Widget build(BuildContext context) {
    return  Wrap(
      spacing: 10.0, // gap between adjacent containers
      runSpacing: 10.0,
      alignment: WrapAlignment.start, // gap between lines
      children: items.map((text) => ServicesContainermodel(text:text,price:"200" ,)).toList(),
    );
  }
}
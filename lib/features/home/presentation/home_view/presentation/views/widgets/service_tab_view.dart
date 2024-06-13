import 'package:fixer/features/home/presentation/views/widgets/container_model.dart';
import 'package:flutter/material.dart';

class ServiceTab extends StatelessWidget {
  const ServiceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ContainerModel(text: "Electric", description:"Expert electrical repairs, fast and reliable.",backgroundpath: "assets/images/plumbing_background.jpg",),
          ContainerModel(text: "Plumbing", description:"Swift plumbing fixes.",backgroundpath: "assets/images/electric_background.jpg",),
          
        ],
      ),
    );
  }
}
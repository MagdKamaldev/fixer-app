import 'package:fixer/features/home/presentation/views/widgets/container_model.dart';
import 'package:flutter/material.dart';

class Storestab extends StatelessWidget {
  const Storestab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) {
        return ContainerModel(text: "store name", description: "welcome to our store",backgroundpath: "assets/images/stores_background.jpg",);
      },);
  }
}
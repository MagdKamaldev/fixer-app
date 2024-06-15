import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/features/home/presentation/home_view/presentation/views/widgets/container_model.dart';
import 'package:flutter/material.dart';

class Storestab extends StatelessWidget {
  const Storestab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
           context.pushNamed(Routes.storesDetails) ;
          },
          child: const ContainerModel(
            text: "store name",
            description: "welcome to our store",
            backgroundpath: "assets/images/stores_background.jpg",
          ),
        );
      },
    );
  }
}

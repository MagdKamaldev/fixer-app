import 'package:fixer/core/routing/app_router.dart';
import 'package:fixer/features/home/presentation/home_view/presentation/views/widgets/container_model.dart';
import 'package:fixer/features/services/presentation/view/services_view.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';

class ServiceTab extends StatelessWidget {
  const ServiceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              navigateTo(context, const ServicesView(id: 16, category: "Electric",));
            },
            child: ContainerModel(
              text: S.of(context).electric,
              description: S.of(context).electricDes,
              backgroundpath: "assets/images/plumbing_background.jpg",
            ),
          ),
          InkWell(
            onTap: () {
              navigateTo(context, const ServicesView(id: 14, category: "Plumbing"));
            },
            child: ContainerModel(
              text: S.of(context).plumbing,
              description: S.of(context).plumbingDes,
              backgroundpath: "assets/images/electric_background.jpg",
            ),
          ),
        ],
      ),
    );
  }
}

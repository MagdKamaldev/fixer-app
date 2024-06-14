import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/features/stores/presentation/views/widgets/store_stack_container.dart';
import 'package:flutter/material.dart';

class StoreDetails extends StatelessWidget {
  const StoreDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        iconTheme: const IconThemeData(color: ColorManager.white),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    color: ColorManager.white,
        child: const Column(
          children: [
            StoreStackContainer()
          ],
        ),
      ),
    );
  }
}
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/requests/presentation/views/widgets/available_craftmen_card_model.dart';
import 'package:flutter/material.dart';

class AvailableCraftmen extends StatelessWidget {
  const AvailableCraftmen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "available craftmen",
          style: TextStyles.subHeadingsBold.copyWith(color: ColorManager.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Expanded(
          child: ListView.builder(
            itemCount: 12,
            itemBuilder: (context, index) {
              return const AvailableCraftmenCard();
            },
          ),
        ),
      ),
    );
  }
}

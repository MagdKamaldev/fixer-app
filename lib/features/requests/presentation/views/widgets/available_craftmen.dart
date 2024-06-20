import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/requests/data/models/order_carftsmen_model.dart';
import 'package:fixer/features/requests/presentation/views/widgets/available_craftmen_card_model.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';

class AvailableCraftmen extends StatelessWidget {
  final List<OrderCarftsmenModel> craftsmen;
  const AvailableCraftmen({super.key, required this.craftsmen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).availablecraftmen,
          style: TextStyles.subHeadingsBold.copyWith(color: ColorManager.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Expanded(
          child: ListView.builder(
            itemCount: craftsmen.length,
            itemBuilder: (context, index) {
              return AvailableCraftmenCard(model: craftsmen[index]);
            },
          ),
        ),
      ),
    );
  }
}

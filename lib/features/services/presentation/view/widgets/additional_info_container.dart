import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';

class AdditionalInfoContainer extends StatelessWidget {
  final TextEditingController additionalInfocontroller;
  const AdditionalInfoContainer({super.key, required this.additionalInfocontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorManager.white,
        border: Border.all(width: 1, color: ColorManager.lightblue),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: TextFormField(
          controller: additionalInfocontroller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter a Additional info if none enter N/A";
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: S.of(context).additionalInfo,
            hintStyle: TextStyles.body,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

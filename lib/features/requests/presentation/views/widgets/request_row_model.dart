import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class RequestRowModel extends StatelessWidget {
  final String label;
  final String description;
  final IconData icon;
  const RequestRowModel({
    super.key,
    required this.label,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: ColorManager.primary,
          size: 30,
        ),
        horizontalSpace(32),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyles.small.copyWith(color: ColorManager.grey),
            ),
            Text(description, style: TextStyles.body)
          ],
        ),
        horizontalSpace(100),
      ],
    );
  }
}

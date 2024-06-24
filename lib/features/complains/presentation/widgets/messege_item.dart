import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class RoundedMessageCard extends StatelessWidget {
  final String message;
  final String sender;

  const RoundedMessageCard({
    super.key,
    required this.message,
    required this.sender,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorManager.primary100,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyles.bodybold.copyWith(color: ColorManager.primary),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyles.body.copyWith(color: ColorManager.white),
          ),
        ],
      ),
    );
  }
}

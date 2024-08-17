import 'package:fixer/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerRoundedMessageCard extends StatelessWidget {
  const ShimmerRoundedMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorManager.primary200,
      highlightColor: ColorManager.primary100,
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 20,
              color: Colors.white,
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 14,
              color: Colors.white,
            ),
            const SizedBox(height: 8),
            Container(
              width: 60,
              height: 12,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

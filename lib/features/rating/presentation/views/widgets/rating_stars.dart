import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:flutter/material.dart';

class RatingStarsRow extends StatelessWidget {
  final int initialRating;
  final ValueChanged<int> onRatingChanged;

  const RatingStarsRow({
    super.key,
    required this.initialRating,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar(
        filledIcon: Icons.star,
        emptyIcon: Icons.star_border_outlined,
        filledColor: Colors.amber,
        emptyColor: ColorManager.grey,
        size: 30,
        initialRating: initialRating.toDouble(),
        alignment: Alignment.center,
        onRatingChanged: (rating) {
          onRatingChanged(rating.toInt());
        });
  }
}

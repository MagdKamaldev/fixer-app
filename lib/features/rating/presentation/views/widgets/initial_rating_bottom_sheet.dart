import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/rating/presentation/views/widgets/rating_stars.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';

class InitialContent extends StatelessWidget {
  final VoidCallback onStarTap;

  const InitialContent({super.key, required this.onStarTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(20),
          Align(
            alignment: locale == "en" ? Alignment.topRight : Alignment.topLeft,
            child: InkWell(
                onTap: () {
                  context.pop();
                },
                child: const Icon(
                  Icons.close,
                  color: ColorManager.primary,
                  size: 25,
                )),
          ),
          const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://th.bing.com/th?id=OIP.TctatNGs7RN-Dfc3NZf91AAAAA&w=212&h=212&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2"),
            radius: 25,
          ),
          verticalSpace(20),
          Text(
            "${S.of(context).howwasyourexperience} yasser ?",
            style: TextStyles.bodybold,
          ),
          RatingStarsRow(onStarTap: onStarTap),
        ],
      ),
    );
  }
}

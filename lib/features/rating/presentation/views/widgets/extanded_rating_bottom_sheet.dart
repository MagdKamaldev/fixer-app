import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/rating/presentation/views/widgets/comment_container.dart';
import 'package:fixer/features/rating/presentation/views/widgets/rating_stars.dart';
import 'package:fixer/features/rating/presentation/views/widgets/submit_botton.dart';
import 'package:fixer/features/rating/presentation/views/widgets/traits_wrap_row.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';

class ExpandedContent extends StatelessWidget {
  const ExpandedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://th.bing.com/th?id=OIP.TctatNGs7RN-Dfc3NZf91AAAAA&w=212&h=212&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2"),
            radius: 25,
          ),
          horizontalSpace(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RatingStarsRow(
                onStarTap: () {},
              ),
              Text(
                "poor ${S.of(context).performance}",
                style: TextStyles.smallbold,
              ),
            ],
          ),
        ]),
        verticalSpace(30),
        const TraitsWrapRow(),
        verticalSpace(30),
        const CommentContainer(),
        verticalSpace(30),
        const SubmitBotton(),
      ]),
    );
  }
}

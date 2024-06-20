import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/home/presentation/home_view/presentation/views/widgets/request_now_container.dart';
import 'package:fixer/features/home/presentation/home_view/presentation/views/widgets/tab_bar.dart';
import 'package:fixer/features/home/presentation/home_view/presentation/views/widgets/welcome_container.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WelcomeContainer(),
        // verticalSpace(3),
        Padding(
          padding: EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).Requestservice,
                style: TextStyles.bodybold,
              ),
              verticalSpace(8),
              const RequestNowContainer(),
              verticalSpace(4),
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.373, // Make TabBarView dynamic
                child: const TabBarContainer(),
              ),
            ],
          ),
        )
      ],
    );
  }
}

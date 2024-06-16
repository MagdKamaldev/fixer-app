import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/features/home/presentation/home_view/presentation/views/widgets/service_tab_view.dart';
import 'package:fixer/features/home/presentation/home_view/presentation/views/widgets/stores_tab_view.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarConatiner extends StatelessWidget {
  const TabBarConatiner({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 180,
                height: 30, // Width for both tabs (50 each)
                child: TabBar(
                  labelColor: ColorManager.primary,
                  unselectedLabelColor: ColorManager.grey,
                  indicatorColor: ColorManager.primary,
                  dividerHeight: 0,
                  indicatorWeight:1,
                  splashBorderRadius: BorderRadius.circular(5),
                  indicatorSize:TabBarIndicatorSize.label,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                        width: 2.5,
                        color: ColorManager.primary), // Change the width and color of the indicator // Adjust the insets as needed
                  ),
                  tabs: [
                    SizedBox(
                      width: 100,
                      child: Tab(text: S.of(context).services),
                    ),
                    SizedBox(
                      width: 100,
                      child: Tab(text: S.of(context).Stores),
                    ),
                  ],
                ),
              ),
            // Pushes the "View All" text to the end of the row
              TextButton(
                onPressed: () {
                  context.pushNamed(Routes.storesviewAll);
                },
                child: Text(
                  S.of(context).viewAll,
                  style: const TextStyle(
                      color: ColorManager.black,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1.5),
                ),
              ),
            ],
          ),
          verticalSpace(3),
          SizedBox(
            width: 350.w,
            height: 103 * 2.h,
            child: const TabBarView(
              children: [ServiceTab(), Storestab()],
            ),
          )
        ],
      ),
    );
  }
}

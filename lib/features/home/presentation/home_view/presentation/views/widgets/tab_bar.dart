import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/features/home/presentation/home_view/presentation/views/widgets/service_tab_view.dart';
import 'package:fixer/features/home/presentation/home_view/presentation/views/widgets/stores_tab_view.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';

class TabBarContainer extends StatelessWidget {
  const TabBarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TabBar(
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                labelColor: ColorManager.primary,
                unselectedLabelColor: ColorManager.grey,
                indicatorColor: ColorManager.primary,
                indicatorPadding: const EdgeInsets.only(bottom: 8),
                indicatorWeight: 1,
                dividerHeight: 0,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(text: S.of(context).services),
                  Tab(text: S.of(context).Stores),
                ],
              ),
              TextButton(
                onPressed: () {
                  context.pushNamed(Routes.storesviewAll);
                },
                child: Text(
                  S.of(context).viewAll,
                  style: const TextStyle(
                    color: ColorManager.black,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1.5,
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(3),
          const Flexible(
            child: TabBarView(
              children: [ServiceTab(), Storestab()],
            ),
          )
        ],
      ),
    );
  }
}

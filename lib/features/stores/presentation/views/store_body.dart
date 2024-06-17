import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/stores/presentation/views/widgets/searchbar_container.dart';
import 'package:fixer/features/home/presentation/home_view/presentation/views/widgets/stores_tab_view.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoresBody extends StatelessWidget {
  const StoresBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchbarContainer(),
            verticalSpace(16),
            Text(
              S.of(context).allStores,
              style: TextStyles.bodybold,
            ),
            verticalSpace(8),
            SizedBox(
                width: 355.w,
                height: MediaQuery.of(context).size.height * 0.69,
                child: const Storestab()),
          ],
        ),
      ),
    );
  }
}

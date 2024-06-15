import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/features/stores/presentation/views/widgets/searchbar_container.dart';
import 'package:fixer/features/stores/presentation/views/widgets/stores_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoresBody extends StatelessWidget {
  const StoresBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SearchbarContainer(),
            verticalSpace(10),
            SizedBox(width: 350.w, height: 96 * 6.h, child: const Storestab())
          ],
        ),
      ),
    );
  }
}

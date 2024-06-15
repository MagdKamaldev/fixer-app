import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/stores/presentation/views/widgets/item_container_model.dart';
import 'package:fixer/features/stores/presentation/views/widgets/searchbar_container.dart';
import 'package:fixer/features/stores/presentation/views/widgets/store_stack_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreDetails extends StatelessWidget {
  const StoreDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        iconTheme: const IconThemeData(color: ColorManager.white),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: ColorManager.white,
        child: Column(
          children: [
            const StoreStackContainer(),
            verticalSpace(10),
            const SearchbarContainer(),
            verticalSpace(10),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  "All Items",
                  style: TextStyles.smallHeadings
                      .copyWith(color: ColorManager.black),
                )),
            verticalSpace(15),
            SizedBox(
              width: 340.w,
              height: 106 * 3.h,
              child: ListView.builder(
                itemBuilder: (context, index) => const ItemConatinerModel(),
                itemCount: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}

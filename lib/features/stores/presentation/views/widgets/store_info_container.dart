import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/features/stores/data/models/stores_model.dart';
import 'package:fixer/features/stores/presentation/views/widgets/store_info_row_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreInfoContainer extends StatelessWidget {
  final StoreModel store;
  const StoreInfoContainer({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      height: 180.h,
      margin: EdgeInsets.only(top: 65.h),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ColorManager.babyblue, width: 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StoreInfoRowModel(
            icon: Icons.store_outlined,
            labeltext: store.name ?? "No Name Yet !",
            labelInfo: store.description ?? "No Description Yet !",
          ),
          StoreInfoRowModel(
            icon: Icons.place_outlined,
            labeltext: store.location ?? "No Location Yet !",
          ),
          StoreInfoRowModel(
            icon: Icons.phone_outlined,
            labeltext: store.phone ?? "No Phone Yet !",
          ),
        ],
      ),
    );
  }
}

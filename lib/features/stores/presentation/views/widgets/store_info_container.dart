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
      margin: EdgeInsets.only(top: 80.h),
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ColorManager.grey, width: 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StoreInfoRowModel(
            icon: Icons.store_outlined,
            labeltext: store.name!,
            labelInfo: store.description ?? "Description",
          ),
          StoreInfoRowModel(
            icon: Icons.place_outlined,
            labeltext: store.location ?? "Location",
          ),
          //TODO: Add the phone number to the store model
          const StoreInfoRowModel(
            icon: Icons.phone_outlined,
            labeltext: "010000000",
          ),
        ],
      ),
    );
  }
}

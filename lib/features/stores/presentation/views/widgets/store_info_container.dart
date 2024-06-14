import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/features/stores/presentation/views/widgets/store_info_row_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreInfoContainer extends StatelessWidget {
  const StoreInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.w,
      height: 220.h,
      margin: EdgeInsets.only(top: 80.h),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorManager.primary100,width: 1)
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StoreInfoRowModel(icon: Icons.store_outlined, labeltext: "store name",labelInfo: "store description",),
          StoreInfoRowModel(icon: Icons.place_outlined, labeltext:"location" ,),
          StoreInfoRowModel(icon: Icons.phone_outlined,labeltext: "010000000",),

        ],
      ),
    );
  }
}
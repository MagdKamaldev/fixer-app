import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemConatinerModel extends StatelessWidget {
  const ItemConatinerModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      padding: const EdgeInsets.all(8),
      width: 340.w,
      height:100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorManager.white,
        border: Border.all(color: ColorManager.grey,width: 1,)
      ),
      child: Row(
        children: [
          Image.asset("assets/images/stores_background.jpg",
          width: 100.w,
          height: 100.h,
          fit: BoxFit.contain,),
          horizontalSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            verticalSpace(8),
            Text("item name",style: TextStyles.small,),
            verticalSpace(3),
            Text("price",style: TextStyles.smallbold,)
            
          ],)
        ],
      ),
    );
  }
}
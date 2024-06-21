import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsModel extends StatelessWidget {
  final String serviceName;
  final String price;
  const OrderDetailsModel({super.key, required this.serviceName, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.w,
      height: 147.h,
      padding: const EdgeInsets.all(18),
      decoration:BoxDecoration(
        color: ColorManager.white,
        border: Border.all(color: ColorManager.lightblue),
        boxShadow: const [
              BoxShadow(
                color: ColorManager.babyblue,
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 2), // changes position of shadow
              ),],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text(orderStatus,style: TextStyles.bodybold,),
          // Text(text,style: TextStyles.body,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on_outlined,color: ColorManager.primary,size:23.sp,),
                  horizontalSpace(5),
              Text("Area",style: TextStyles.smallbold.copyWith(color: ColorManager.grey),),
                ],
              ),
              Row(
            children: [
              Icon(Icons.money,color:Colors.green,size:23.sp,),
              horizontalSpace(5),
              Text(price,style: TextStyles.smallbold.copyWith(color: ColorManager.grey),),
            ],
          ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.category_outlined,color: ColorManager.primary,size:23.sp,),
              horizontalSpace(5),
              Text("category",style: TextStyles.small.copyWith(color: ColorManager.grey),),
              horizontalSpace(5),
              Text("-",style: TextStyles.small.copyWith(color: ColorManager.grey),),
              horizontalSpace(5),
              Text(serviceName,style: TextStyles.small.copyWith(color: ColorManager.grey),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.calendar_today_outlined,color:ColorManager.primary,size:23.sp,),
              horizontalSpace(5),
              Text("time",style: TextStyles.smallbold.copyWith(color: ColorManager.grey),),
            ],
          )
        ],
      ),
    ) ;
  }
}
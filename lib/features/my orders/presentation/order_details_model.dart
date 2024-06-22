import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsModel extends StatelessWidget {
  final String price;
  final DateTime time;
  final int id;
  const OrderDetailsModel(
      {super.key,
      required this.price,
      required this.time,
      required this.id,
     });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.w,
      height: 147.h,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: ColorManager.white,
        border: Border.all(color: ColorManager.lightblue),
        boxShadow: const [
          BoxShadow(
            color: ColorManager.babyblue,
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                Icons.numbers,
                size: 23.sp,
              ),
              horizontalSpace(5),
              Text(
                id.toString(),
                style:
                    TextStyles.smallbold.copyWith(color: ColorManager.grey),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             
              Row(
                children: [
                  Icon(
                    Icons.money,
                    color: Colors.green,
                    size: 23.sp,
                  ),
                  horizontalSpace(5),
                  Text(
                    "$price ج.م.",
                    style:
                        TextStyles.smallbold.copyWith(color: ColorManager.grey),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.watch,
                    color: ColorManager.primary,
                    size: 23.sp,
                  ),
                  horizontalSpace(5),
                  Text(
                    "${time.hour}:${time.minute}",
                    style:
                        TextStyles.smallbold.copyWith(color: ColorManager.grey),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    color: ColorManager.primary,
                    size: 23.sp,
                  ),
                  horizontalSpace(5),
                  Text(
                    time
                        .subtract(const Duration(hours: 2))
                        .toString()
                        .substring(0, 10),
                    style:
                        TextStyles.smallbold.copyWith(color: ColorManager.grey),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

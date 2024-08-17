import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderContainerModel extends StatelessWidget {
  final String text;
  final String description;
  final String backgroundpath;
  const OrderContainerModel(
      {super.key,
      required this.text,
      required this.description,
      required this.backgroundpath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355.w,
      height: 96.h,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 250.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style:
                      TextStyles.bodybold.copyWith(color: ColorManager.primary),
                ),
                Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyles.small.copyWith(color: ColorManager.primary),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/stores/data/models/item_model/item_model.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemConatinerModel extends StatelessWidget {
  final ItemModel item;
  const ItemConatinerModel({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      width: 350.w,
      height: 106.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorManager.babyblue),
        boxShadow: const [
                BoxShadow(
                  color:ColorManager.babyblue,
                  spreadRadius:0,
                  blurRadius: 4,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
        color: ColorManager.white,
      ),
      child: Row(
        children: [
          horizontalSpace(10),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Image.network(
              item.image!,
              width: 90.w,
              height: 90.h,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // verticalSpace(10),
                Text(
                  item.name!,
                  style: TextStyles.smallHeadings.copyWith(color: ColorManager.black),
                ),
                verticalSpace(15),
                Row(
                  children: [
                    Text(
                      "${item.price!} LE",
                      style: TextStyles.smallHeadings.copyWith(color: ColorManager.black,fontWeight: FontWeight.w600),
                    ),
                    horizontalSpace(70),
                    Text(
                      "${item.quantity.toString()} ${S.of(context).left}",
                      style: TextStyles.smallHeadings.copyWith(color: ColorManager.black,fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

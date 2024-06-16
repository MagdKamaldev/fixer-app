import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/stores/data/models/item_model/item_model.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemConatinerModel extends StatelessWidget {
  final ItemModel item;
  const ItemConatinerModel({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      width: 340.w,
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorManager.white,
      ),
      child: Card(
        color: ColorManager.white,
        elevation: 4,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              child: Image.network(
                item.image!,
                width: 100.w,
                height: 100.h,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    item.name!,
                    style: TextStyles.headings,
                  ),
                  Row(
                    children: [
                      horizontalSpace(20),
                      Text(
                        item.price!,
                        style: TextStyles.body,
                      ),
                      horizontalSpace(50),
                      Text(
                        "${item.quantity.toString()} ${S.of(context).left}",
                        style: TextStyles.body,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

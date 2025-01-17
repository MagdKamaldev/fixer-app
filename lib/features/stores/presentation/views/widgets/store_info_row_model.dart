import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreInfoRowModel extends StatelessWidget {
  final String labeltext;
  final String? labelInfo;
  final IconData icon;
  const StoreInfoRowModel(
      {super.key, required this.labeltext, this.labelInfo, required this.icon});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.5;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          horizontalSpace(20),
          Icon(
            icon,
            size: 25.sp,
            color: ColorManager.primary,
          ),
          horizontalSpace(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size,
                child: Text(labeltext,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyles.smallbold
                        .copyWith(color: ColorManager.primary)),
              ),
              if (labelInfo != null)
                Text(
                  labelInfo!,
                  style: TextStyles.small.copyWith(color: ColorManager.primary),
                ),
            ],
          )
        ],
      ),
    );
  }
}

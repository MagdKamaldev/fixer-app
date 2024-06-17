import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerModel extends StatelessWidget {
  final String text;
  final String description;
  final String backgroundpath;
  const ContainerModel(
      {super.key,
      required this.text,
      required this.description,
      required this.backgroundpath});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: 355.w,
      height: 96.h,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(backgroundpath),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                ColorManager.primary.withOpacity(0.85), BlendMode.srcOver)),
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
                      TextStyles.bodybold.copyWith(color: ColorManager.white),
                ),
                Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyles.small.copyWith(color: ColorManager.white),
                )
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: ColorManager.white,
            size: 25,
          )
        ],
      ),
    );
  }
}

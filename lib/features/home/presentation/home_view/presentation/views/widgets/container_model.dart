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
    return Container(
      width: 350.w,
      height: 90.h,
      padding: const EdgeInsets.all(9),
      margin: const EdgeInsets.all(3),
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
            // color: Colors.blueGrey,
            width: 250.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyles.whitesmallHeadings,
                ),
                Text(
                  description,
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

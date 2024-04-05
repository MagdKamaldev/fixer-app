import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingContainer extends StatelessWidget {
  final String image;
  final String text;
  const OnBoardingContainer(
      {super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: ColorManager.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 290.h,
            child: SvgPicture.asset(image),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(text,
                textAlign: TextAlign.center,
                style:TextStyles.headings
                    ),
          )
        ],
      ),
    );
  }
}

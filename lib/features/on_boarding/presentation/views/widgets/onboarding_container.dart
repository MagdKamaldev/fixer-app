import 'package:fixer/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
          SizedBox(child: SvgPicture.asset(image)),
          Container(
            padding: EdgeInsets.only(top: 40.h),
            child: Text(text,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    color: ColorManager.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 24)),
          )
        ],
      ),
    );
  }
}

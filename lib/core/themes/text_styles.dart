import 'package:fixer/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle normal = TextStyle(
    color: ColorManager.black,
    fontSize: 28.sp,
    fontFamily: GoogleFonts.roboto().fontFamily,
    fontWeight: FontWeight.w400,
  );
  static TextStyle headings = TextStyle(
    color: ColorManager.black,
    fontSize: 24.sp,
    fontFamily: GoogleFonts.roboto().fontFamily,
    fontWeight: FontWeight.w600,
  );
  static TextStyle subHeadingsBold = TextStyle(
    color: ColorManager.black,
    fontSize: 19.sp,
    fontFamily: GoogleFonts.roboto().fontFamily,
    fontWeight: FontWeight.w500,
  );
  static TextStyle subHeadings = TextStyle(
    color: ColorManager.black,
    fontSize: 19.sp,
    fontFamily: GoogleFonts.roboto().fontFamily,
    fontWeight: FontWeight.w400,
  );
  static TextStyle body = TextStyle(
    color: ColorManager.black,
    fontSize: 16.sp,
    fontFamily: GoogleFonts.roboto().fontFamily,
    fontWeight: FontWeight.w400,
  );
  static TextStyle small = TextStyle(
    color: ColorManager.black,
    fontSize: 14.sp,
    fontFamily: GoogleFonts.roboto().fontFamily,
    fontWeight: FontWeight.w400,
  );
}

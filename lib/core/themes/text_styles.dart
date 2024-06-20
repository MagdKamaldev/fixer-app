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
  static TextStyle lightHeadings = TextStyle(
    color: ColorManager.primary,
    fontSize: 22.sp,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    fontWeight: FontWeight.w400,
  );
  static TextStyle subHeadingsBold = TextStyle(
    color: ColorManager.black,
    fontSize: 19.sp,
    fontFamily: GoogleFonts.roboto().fontFamily,
    fontWeight: FontWeight.w600,
  );
  static TextStyle subHeadings = TextStyle(
    color: ColorManager.black,
    fontSize: 19.sp,
    fontFamily: GoogleFonts.roboto().fontFamily,
    fontWeight: FontWeight.w400,
  );
  static TextStyle smallHeadings = TextStyle(
    color: ColorManager.darkgrey,
    fontSize: 18.sp,
    fontFamily: GoogleFonts.roboto().fontFamily,
    fontWeight: FontWeight.w400,
  );
  static TextStyle darksmallHeadings = TextStyle(
    color: ColorManager.black,
    fontSize: 18.sp,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    fontWeight: FontWeight.w400,
  );
  static TextStyle whitesmallHeadings = TextStyle(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      color: ColorManager.white,
      fontSize: 18.sp,
      fontWeight: FontWeight.w400);
  static TextStyle primarysmallHeadings = TextStyle(
    color: ColorManager.primary,
    fontSize: 18.sp,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    fontWeight: FontWeight.w400,
  );
  static TextStyle primarytextbutton = TextStyle(
    color: ColorManager.primary,
    fontSize: 16.sp,
    fontFamily: GoogleFonts.roboto().fontFamily,
    fontWeight: FontWeight.w700,
  );
  static TextStyle body = TextStyle(
    color: ColorManager.black,
    fontSize: 16.sp,
    fontFamily: GoogleFonts.roboto().fontFamily,
    fontWeight: FontWeight.w400,
  );
  static TextStyle bodybold = TextStyle(
    color: ColorManager.black,
    fontSize: 16.sp,
    fontFamily: GoogleFonts.roboto().fontFamily,
    fontWeight: FontWeight.w600,
  );

  static TextStyle small = TextStyle(
    color: ColorManager.black,
    fontSize: 14.sp,
    fontFamily: GoogleFonts.roboto().fontFamily,
    fontWeight: FontWeight.w400,
  );
  static TextStyle smallbold = TextStyle(
    color: ColorManager.black,
    fontSize: 14.sp,
    fontFamily: GoogleFonts.roboto().fontFamily,
    fontWeight: FontWeight.w600,
  );
  
}

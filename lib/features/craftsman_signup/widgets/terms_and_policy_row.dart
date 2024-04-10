import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsandPolicy extends StatefulWidget {
  const TermsandPolicy({super.key});

  @override
  State<TermsandPolicy> createState() => _TermsandPolicyState();
}

class _TermsandPolicyState extends State<TermsandPolicy> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.sp),
      child: Row(
        children: [
          Checkbox(
            value: isSelected,
            onChanged: (bool? selection) {
              setState(() {
                isSelected = !isSelected;
              });
            },
            checkColor: ColorManager.primary,
            activeColor: ColorManager.white,
            focusColor: ColorManager.black,
          ),
          Text(S.of(context).agree, style: TextStyles.smallbold),
          GestureDetector(
              onTap: () {},
              child: Text(S.of(context).termsandpolicy,
                  style: GoogleFonts.roboto(
                      color: ColorManager.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          ColorManager.black, // Optional: Set underline color
                      decorationThickness: 2)))
          /*TextButton(
              onPressed: () {},
              child: Text(
                "terms & policy",
                style: TextStyles.smallbold,
              ))*/
        ],
      ),
    );
  }
}

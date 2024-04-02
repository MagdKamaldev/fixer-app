import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/widgets/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SkipBotton extends StatefulWidget {
  final PageController controller;
  const SkipBotton({super.key, required this.controller});

  @override
  State<SkipBotton> createState() => _SkipBottonState();
}

class _SkipBottonState extends State<SkipBotton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushReplacementNamed(Routes.login);
      },
      child: Container(
        alignment: Alignment.topRight,
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 70.h),
        child: Text(
          "Skip",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: ColorManager.grey,
          ),
        ),
      ),
    );
  }
}

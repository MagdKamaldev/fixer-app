import 'package:fixer/core/widgets/routing/routes.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';

class NextButtton extends StatefulWidget {
  const NextButtton({super.key});

  @override
  State<NextButtton> createState() => _NextButttonState();
}

class _NextButttonState extends State<NextButtton> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController phonenumber = TextEditingController();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: ElevatedButton(
        onPressed: () {
          debugPrint("Phone : ${phonenumber.text}");
          Navigator.of(context).pushNamed(Routes.resetPassword);
        },
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: ColorManager.primary,
          minimumSize: Size.fromHeight(52.h),
        ),
        child: Text(
          S.of(context).nextbutton,
          style: TextStyle(
              color: ColorManager.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

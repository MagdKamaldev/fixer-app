import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/colors.dart';

class ResetButtton extends StatelessWidget {
  const ResetButtton({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordnew = TextEditingController();
    final TextEditingController passwordconfirmation = TextEditingController();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: ElevatedButton(
        onPressed: () {
          debugPrint("Phone : ${passwordnew.text}");
          debugPrint("Phone : ${passwordconfirmation.text}");
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

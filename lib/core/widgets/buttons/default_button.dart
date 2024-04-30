
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/colors.dart';

class DefaultButton extends StatelessWidget {
  final String text;
   final void Function() onPressed;
  const DefaultButton({super.key, required this.text, required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: ColorManager.primary,
          minimumSize: Size.fromHeight(55.h)),
      child: Text(
        text,
        style: TextStyle(
            color: ColorManager.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}

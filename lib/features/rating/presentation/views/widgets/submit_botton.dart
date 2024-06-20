import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitBotton extends StatefulWidget {
  const SubmitBotton({super.key});

  @override
  State<SubmitBotton> createState() => _SubmitBottonState();
}

class _SubmitBottonState extends State<SubmitBotton> {

  Color _buttonColor = ColorManager.darkgrey; // Initial button color

  void _changeColor() {
    setState(() {
      _buttonColor = ColorManager.primary; // Change button color to green when pressed
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed:_changeColor,
        color:_buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(10),
        minWidth: 119.w,
        height: 44.h,
        child: Text(S.of(context).submit,style: TextStyles.smallbold.copyWith(color: ColorManager.white),
        
        ),

        );
  }
}
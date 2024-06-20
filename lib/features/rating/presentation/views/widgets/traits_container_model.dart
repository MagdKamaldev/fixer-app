import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TraitsContainerModel extends StatefulWidget {
  final VoidCallback? onTap;
  final bool isSelected;
  const TraitsContainerModel({super.key, this.onTap, required this.isSelected});

  @override
  State<TraitsContainerModel> createState() => _TraitsContainerModelState();
}

class _TraitsContainerModelState extends State<TraitsContainerModel> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: IntrinsicWidth(
        child: Container(
          height: 50.h,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(30),
            border: isSelected
                ? Border.all(color: ColorManager.primary)
                : Border.all(color: ColorManager.lightblue),
            boxShadow: const [
              BoxShadow(
                color: ColorManager.babyblue,
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Text("traits",
              style: TextStyles.body.copyWith(color: ColorManager.primary)),
        ),
      ),
    );
  }
}

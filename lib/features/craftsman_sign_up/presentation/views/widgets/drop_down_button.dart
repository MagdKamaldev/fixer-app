import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CityDropDown extends StatefulWidget {
  const CityDropDown({super.key});

  @override
  State<CityDropDown> createState() => _CityDropDownState();
}

class _CityDropDownState extends State<CityDropDown> {
  String? valueChoose;
  List<String> listItem = ["city1", "city2", "city3", "city4"];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.w,
      height: 55.h,
      decoration: BoxDecoration(
          border: Border.all(color: ColorManager.black),
          borderRadius: BorderRadius.circular(10.sp)),
      padding: EdgeInsets.symmetric(horizontal: 25.h),
      child: DropdownButton<String>(
        hint: Text(S.of(context).cityfield),
        style: TextStyles.body.copyWith(color: ColorManager.darkgrey),
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 25,
        isExpanded: true,
        underline: const SizedBox(),
        value: valueChoose,
        onChanged: (String? newvalue) {
          setState(() {
            valueChoose = newvalue;
          });
        },
        items: listItem.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        }).toList(),
      ),
    );
  }
}

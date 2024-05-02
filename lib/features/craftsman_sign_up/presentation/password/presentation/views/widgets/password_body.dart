import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/core/widgets/arrow/presentation/views/arrow_button.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordBody extends StatelessWidget {
  PasswordBody({super.key});

  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: locale == "en"
                ? EdgeInsets.only(right: 250.w)
                : EdgeInsets.only(left: 270.w),
            child: Text(
              S.of(context).password,
              style: TextStyles.bodybold,
            ),
          ),
          verticalSpace(5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            width: 385.w,
            height: 55.h,
            child: TextFormField(
              controller: password,
              keyboardType: TextInputType.text,
              obscureText: true,
              style: TextStyles.small,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: S.of(context).password,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                      borderSide: const BorderSide(
                          width: 1, color: ColorManager.black)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                    borderSide:
                        const BorderSide(width: 1, color: ColorManager.black),
                  )),
            ),
          ),
          verticalSpace(10),
          Padding(
            padding: locale == "en"
                ? EdgeInsets.only(left: 25.w)
                : EdgeInsets.only(right: 20.w),
            child: SizedBox(
              width: 340.w,
              child: Text(
                S.of(context).passwordinstructions,
                style: TextStyles.small.copyWith(color: Colors.red),
              ),
            ),
          ),
          verticalSpace(50),
          Padding(
            padding: locale == "en"
                ? EdgeInsets.only(left: 230.w)
                : EdgeInsets.only(right: 230.w),
            child:ReusableArrowButton(nextPage: Routes.craftsmanSignUp,onPressed: (){},),
          ),
        ],
      ),
    );
  }
}

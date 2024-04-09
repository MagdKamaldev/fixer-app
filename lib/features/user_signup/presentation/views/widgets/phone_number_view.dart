import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/user_signup/presentation/views/widgets/arrow_button.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumberView extends StatelessWidget {
  const PhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phonenumb = TextEditingController();
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: locale == "en"
                ? const EdgeInsets.only(right: 250)
                : const EdgeInsets.only(left: 280),
            child: Text(
              S.of(context).phone,
              style: TextStyles.bodybold,
            ),
          ),
          verticalSpace(5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            width: 385.w,
            height: 55.h,
            child: TextFormField(
              controller: phonenumb,
              keyboardType: TextInputType.phone,
              style: TextStyles.small,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: S.of(context).enteryphonenumber,
                  // labelText:S.of(context).phone,
                  // labelStyle: TextStyle(color: ColorManager.black),
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
          verticalSpace(100),
          const ArrowButton(),
        ],
      ),
    );
  }
}

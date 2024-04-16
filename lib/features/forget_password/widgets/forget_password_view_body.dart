import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/features/forget_password/widgets/next_buttton.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/constants.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/themes/text_styles.dart';
import '../../../generated/l10n.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phonenumber = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      // verticalSpace(50),
      const Logo(),
      verticalSpace(25),
      Text(
        S.of(context).forgotpass,
        style: TextStyles.headings,
      ),
      verticalSpace(25),
      Text(
        S.of(context).messageforgotpass,
        style: TextStyles.body,
        textAlign: TextAlign.center,
      ),
      verticalSpace(40),
      Padding(
          padding: locale == "en"
              ?  EdgeInsets.only(right: 220.w)
              :  EdgeInsets.only(left: 250.w),
          child: Text(
            S.of(context).phone,
            style: TextStyles.bodybold,
          )),
      verticalSpace(5),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          width: 385.w,
          height: 50.h,
          child: TextFormField(
              controller: phonenumber,
              keyboardType: TextInputType.phone,
              style: TextStyles.small,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: S.of(context).enteryphonenumber,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                      borderSide: const BorderSide(
                          width: 1, color: ColorManager.black)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                      borderSide: const BorderSide(
                          width: 1, color: ColorManager.black))))),
      verticalSpace(25),
      const NextButtton()
    ]);
  }
}

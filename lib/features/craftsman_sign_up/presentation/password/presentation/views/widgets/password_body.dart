// ignore_for_file: must_be_immutable

import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/arrow/presentation/views/arrow_button.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String? craftsmanPassword = "";

class PasswordBody extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  PasswordBody({super.key});

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).password,
              style: TextStyles.bodybold,
            ),
            verticalSpace(5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              width: 385.w,
              height: 85.h,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).emptyValidation;
                  }
                  const pattern =
                      r'^(?=(.*\d){2})(?=(.*[a-zA-Z]){2})(?=(.*\W){2}).*$';

                  if (!RegExp(pattern).hasMatch(value)) {
                    return S.of(context).passwordinstructions;
                  }

                  return null;
                },
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                style: TextStyles.small,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: S.of(context).password,
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.sp),
                      borderSide: const BorderSide(width: 1, color: Colors.red),
                    ),
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
            Align(
              alignment: Alignment.topRight,
              child: ReusableArrowButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    craftsmanPassword = passwordController.text;
                    context.pushNamed(Routes.craftsmanSignUp);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

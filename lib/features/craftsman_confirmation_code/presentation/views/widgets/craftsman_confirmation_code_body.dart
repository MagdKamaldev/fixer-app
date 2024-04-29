import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/craftsman_confirmation_code/presentation/views/widgets/code_textfield_model.dart';
import 'package:fixer/features/user_confirmation_code/presentation/views/widgets/text_buttons.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CraftsmanConfirmationCodeBody extends StatelessWidget {
  const CraftsmanConfirmationCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: SvgPicture.asset('assets/images/fixrpic.svg',
                  width: 134.85.w, height: 91.h),
            ),
            verticalSpace(20),
            Text(
              S.of(context).entercode,
              style: TextStyles.subHeadingsBold,
            ),
            verticalSpace(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).enteryourcode, style: TextStyles.body),
                // Text()
              ],
            ),
            verticalSpace(35),
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CraftsmanTextFieldModel(),
                  CraftsmanTextFieldModel(),
                  CraftsmanTextFieldModel(),
                  CraftsmanTextFieldModel(),
                  CraftsmanTextFieldModel(),
                  CraftsmanTextFieldModel(lastTextField: true),
                ]),
            verticalSpace(35),
            Text(S.of(context).after40sec, style: TextStyles.body),
            verticalSpace(15),
            ResendTextButton(text:S.of(context).resendcodeSMS),
            verticalSpace(15),
            Text(S.of(context).nocoderecieved,
                style: TextStyles.body.copyWith(fontSize: 14.9.sp)),
            verticalSpace(15),
            ResendTextButton(text:S.of(context).resendcodeCALL),
            verticalSpace(60),
             Padding(
          padding: locale == "en"
                ? EdgeInsets.only(left: 230.w)
                : EdgeInsets.only(right: 230.w),
        ),
          ],
        ),
      ]);
  }
}

import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/routing/routes.dart';
import 'package:fixer/features/confirmation_code/presentation/views/widgets/code_textfield_model.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConfirmationCodeBody extends StatelessWidget {
  const ConfirmationCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: SvgPicture.asset('assets/images/fixrpic.svg',
                  width: 134.85, height: 91),
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
                  TextFieldModel(),
                  TextFieldModel(),
                  TextFieldModel(),
                  TextFieldModel(),
                  TextFieldModel(),
                  TextFieldModel(),
                ]),
            verticalSpace(35),
            Text(S.of(context).after40sec, style: TextStyles.body),
            verticalSpace(15),
            Text(S.of(context).resendcodeSMS,
                style: TextStyles.bodybold.copyWith(
                    color: ColorManager.grey,
                    decoration: TextDecoration.underline)),
            verticalSpace(15),
            Text(S.of(context).nocoderecieved,
                style: TextStyles.body.copyWith(fontSize: 14.9)),
            verticalSpace(15),
            Text(S.of(context).resendcodeCALL,
                style: TextStyles.bodybold.copyWith(
                  color: ColorManager.grey,
                  decoration: TextDecoration.underline,
                )),
            verticalSpace(15),
          ],
        ),
      ]),
    );
  }
}

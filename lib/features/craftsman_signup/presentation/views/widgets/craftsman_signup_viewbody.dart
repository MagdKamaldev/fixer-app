import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/features/craftsman_signup/presentation/views/widgets/arrow.dart';
import 'package:fixer/features/craftsman_signup/presentation/views/widgets/craftsman_signup_textform.dart';
import 'package:fixer/features/craftsman_signup/presentation/views/widgets/terms_and_policy_row.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_logo.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_text_container.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';

class CraftsmanSignUpViewBody extends StatelessWidget {
  const CraftsmanSignUpViewBody({super.key});
  static final TextEditingController firstNameController = TextEditingController();
  static final TextEditingController lastNameController = TextEditingController();
  static final TextEditingController idController = TextEditingController();
  static final TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        verticalSpace(50),
        const Logo(),
        verticalSpace(40),
        TextContainer(text: S.of(context).firstname, margin: 35),
        verticalSpace(5),
        CraftsmanSignUpTextForm(
            controller: firstNameController,
            text: S.of(context).firstnamefield,
            textInputType: TextInputType.name),
        verticalSpace(15),
        TextContainer(text: S.of(context).lasttname, margin: 35),
        verticalSpace(5),
        CraftsmanSignUpTextForm(
          controller: lastNameController,
          text: S.of(context).lasttnamefield,
          textInputType: TextInputType.name,
        ),
        verticalSpace(15),
        TextContainer(text: S.of(context).nationalid, margin: 35),
        verticalSpace(5),
        CraftsmanSignUpTextForm(
            controller: idController,
            text: S.of(context).nationalidfield,
            textInputType: TextInputType.number),
        verticalSpace(15),
        TextContainer(text: S.of(context).city, margin: 35),
        verticalSpace(5),
        CraftsmanSignUpTextForm(
          controller: cityController,
          text: S.of(context).cityfield,
          textInputType: TextInputType.name,
          dropIcon: const Icon(
            Icons.keyboard_arrow_down,
            color: ColorManager.primary,
            size: 40,
          ),
        ),
        verticalSpace(10),
        const TermsandPolicy(),
        verticalSpace(30),
        const Arrow()
      ]),
    ]);
  }
}
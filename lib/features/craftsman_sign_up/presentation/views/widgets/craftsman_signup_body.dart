import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/core/widgets/arrow/presentation/views/arrow_button.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/views/widgets/craftsman_signup_textform.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/views/widgets/terms_and_policy_row.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_logo.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_text_container.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';

class CraftsmanSignUpViewBody extends StatelessWidget {
  const CraftsmanSignUpViewBody({super.key});
  static final TextEditingController firstNameController =
      TextEditingController();
  static final TextEditingController lastNameController =
      TextEditingController();
  static final TextEditingController idController = TextEditingController();
  static final TextEditingController emailController = TextEditingController();
  static bool isAgreed = false;
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
        TextContainer(text: S.of(context).email, margin: 35),
        verticalSpace(10),
        CraftsmanSignUpTextForm(
            controller: emailController,
            text: S.of(context).emailfield,
            textInputType: TextInputType.emailAddress),
        verticalSpace(10),
        const TermsandPolicy(),
        verticalSpace(30),
        Align(
          alignment: Alignment.topRight,
          child: ReusableArrowButton(
            onPressed: () {
              context.pushNamed(Routes.fieldOfService);
            },
          ),
        ),
        verticalSpace(30),
      ]),
    ]);
  }
}

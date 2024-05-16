import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/routing/app_router.dart';
import 'package:fixer/core/widgets/arrow/presentation/views/arrow_button.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/fields_of_service/fields_view.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/views/widgets/craftsman_signup_textform.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/views/widgets/terms_and_policy_row.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_logo.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_text_container.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';

class CraftsmanSignUpViewBody extends StatelessWidget {
  const CraftsmanSignUpViewBody({super.key});
  static final TextEditingController nameController = TextEditingController();
  static final TextEditingController userNameController =
      TextEditingController();
  static final TextEditingController idController = TextEditingController();
  static final TextEditingController emailController = TextEditingController();
  static bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: ListView(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Logo(),
          verticalSpace(40),
          TextContainer(text: S.of(context).name, margin: 35),
          verticalSpace(5),
          CraftsmanSignUpTextForm(
              validate: (String value) {
                if (value.isEmpty) {
                  return S.of(context).emptyValidation;
                }
                return null;
              },
              controller: nameController,
              text: S.of(context).nameField,
              textInputType: TextInputType.name),
          verticalSpace(15),
          TextContainer(text: S.of(context).userName, margin: 35),
          verticalSpace(5),
          CraftsmanSignUpTextForm(
            validate: (String value) {
              if (value.isEmpty) {
                return S.of(context).emptyValidation;
              }
              return null;
            },
            controller: userNameController,
            text: S.of(context).UserNameField,
            textInputType: TextInputType.name,
          ),
          verticalSpace(15),
          TextContainer(text: S.of(context).nationalid, margin: 35),
          verticalSpace(5),
          CraftsmanSignUpTextForm(
              validate: (String value) {
                if (value.isEmpty) {
                  return S.of(context).emptyValidation;
                }
                return null;
              },
              controller: idController,
              text: S.of(context).nationalidfield,
              textInputType: TextInputType.number),
          verticalSpace(15),
          TextContainer(text: S.of(context).email, margin: 35),
          verticalSpace(10),
          CraftsmanSignUpTextForm(
              validate: (String value) {
                if (value.isEmpty) {
                  return S.of(context).emptyValidation;
                }
                return null;
              },
              controller: emailController,
              text: S.of(context).emailfield,
              textInputType: TextInputType.emailAddress),
          verticalSpace(10),
          const TermsandPolicy(),
          verticalSpace(30),
          Align(
            alignment: Alignment.topRight,
            child: ReusableArrowButton(onPressed: () {
              if (formKey.currentState!.validate() && isCraftManAgreed) {
                navigateTo(
                    context,
                    FieldOfService(
                        name: nameController.text,
                        userName: userNameController.text,
                        email: emailController.text));
              }
            }),
          ),
          verticalSpace(30),
        ]),
      ]),
    );
  }
}

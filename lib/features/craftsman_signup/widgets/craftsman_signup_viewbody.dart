import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/features/craftsman_signup/widgets/craftsman_signup_textform.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_logo.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_text_container.dart';
import 'package:flutter/material.dart';

class CraftsmanSignUpViewBody extends StatelessWidget {
  const CraftsmanSignUpViewBody({super.key});
  static final TextEditingController nameController = TextEditingController();
  static final TextEditingController idController = TextEditingController();
  static final TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(children: [
        const Logo(),
        verticalSpace(20),
        TextContainer(text: "First name", margin: 35),
        verticalSpace(5),
        CraftsmanSignUpTextForm(
            controller: nameController,
            text: "Enter your first name",
            textInputType: TextInputType.name),
        verticalSpace(15),
        TextContainer(text: "Last name", margin: 35),
        verticalSpace(5),
        CraftsmanSignUpTextForm(
            controller: nameController,
            text: "Enter your last name",
            textInputType: TextInputType.name),
        verticalSpace(15),
        TextContainer(text: "National ID", margin: 35),
        verticalSpace(5),
        CraftsmanSignUpTextForm(
            controller: idController,
            text: "Enter your national ID",
            textInputType: TextInputType.number),
        verticalSpace(15),
        TextContainer(text: "City", margin: 35),
        verticalSpace(5),
        CraftsmanSignUpTextForm(
            controller: cityController,
            text: "Enter your first name",
            textInputType: TextInputType.name),
      ]),
    ]);
  }
}

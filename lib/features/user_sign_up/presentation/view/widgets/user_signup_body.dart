import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/models/user_model.dart';
import 'package:fixer/core/networks/errors/error_snackbar.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/views/widgets/terms_and_policy_row.dart';
import 'package:fixer/features/user_sign_up/data/repos/user_signup_repository_implementation.dart';
import 'package:fixer/features/user_sign_up/manager/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:fixer/features/user_sign_up/manager/user_sign_up_cubit/user_sign_up_cubit.dart';
import 'package:fixer/features/user_sign_up/presentation/user_phone_number/presentation/views/widgets/user_phone_number_body.dart';
import 'package:fixer/features/user_sign_up/presentation/view/widgets/signup_buttons.dart';
import 'package:fixer/features/user_sign_up/presentation/view/widgets/user_first_signup_textform.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../login/presentation/views/widgets/login_view_body_text_container.dart';

bool isAgreed = false;

class UserSignUpFirstBody extends StatefulWidget {
  final PageController? controller;
  const UserSignUpFirstBody({super.key, this.controller});

  @override
  State<UserSignUpFirstBody> createState() => _UserSignUpFirstBodyState();
}

class _UserSignUpFirstBodyState extends State<UserSignUpFirstBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhoneAuthCubit(),
      child: BlocProvider(
        create: (context) =>
            UserSignUpCubit(getIt<UserSignUpRepositoryImpelemntation>()),
        child: BlocConsumer<UserSignUpCubit, UserSignUpState>(
          listener: (context, state) {
            if (state is UserSignUpSuccess) {
              widget.controller!.animateToPage(2,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            }
          },
          builder: (context, state) {
            return Form(
              key: formKey,
              child: ListView(children: [
                Column(children: [
                  TextContainer(text: S.of(context).fullname, margin: 35),
                  verticalSpace(5),
                  UserSignUpTextForm(
                      validate: (value) {
                        if (value.isEmpty) {
                          return S.of(context).emptyValidation;
                        }
                      },
                      obscure: false,
                      controller: nameController,
                      text: S.of(context).fullnamefield,
                      textInputType: TextInputType.name),
                  verticalSpace(15),
                  TextContainer(text: S.of(context).email, margin: 35),
                  verticalSpace(5),
                  UserSignUpTextForm(
                    validate: (value) {
                      if (value.isEmpty) {
                        return S.of(context).emptyValidation;
                      }
                    },
                    obscure: false,
                    controller: emailController,
                    text: S.of(context).emailfield,
                    textInputType: TextInputType.name,
                  ),
                  verticalSpace(15),
                  TextContainer(text: S.of(context).password, margin: 35),
                  verticalSpace(5),
                  UserSignUpTextForm(
                    validate: (value) {
                      if (value.isEmpty) {
                        return S.of(context).emptyValidation;
                      }
                    },
                    obscure: obscure,
                    controller: passwordController,
                    text: S.of(context).passwordform,
                    textInputType: TextInputType.text,
                    icon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                      child: setpasswordIcon(),
                    ),
                  ),
                  verticalSpace(0),
                  const TermsandPolicy(),
                  verticalSpace(10),
                  ButtonSignUp(
                    onGooglePressed: () {
                      if (isAgreed && phoneNumber != "") {
                        UserSignUpCubit.get(context).signUpWithGoogle(context);
                      } else if (!isAgreed) {
                        showErrorSnackbar(
                            context, S.of(context).accepttermsandpolicy);
                      } else if (phoneNumber == "") {
                        showErrorSnackbar(
                            context, S.of(context).phoneValidation);
                      }
                    },
                    onPressed: () {
                      if (formKey.currentState!.validate() &&
                          isAgreed &&
                          phoneNumber != "") {
                        UserSignUpCubit.get(context).userSignUp(
                            UserModel(
                              email: emailController.text,
                              name: nameController.text,
                              username: nameController.text,
                              phone: phoneNumber,
                              userType: "client",
                            ),
                            passwordController.text,
                            context);
                      } else if (formKey.currentState!.validate() &&
                          !isAgreed) {
                        showErrorSnackbar(
                          context,
                          S.of(context).accepttermsandpolicy,
                        );
                      } else if (phoneNumber == "") {
                        showErrorSnackbar(
                          context,
                          S.of(context).phoneValidation,
                        );
                      }
                    },
                  ),
                  verticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).alreadyhaveaccount,
                        style: TextStyles.bodybold,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(Routes.login);
                          },
                          child: Text(
                            S.of(context).login,
                            style: TextStyles.primarytextbutton,
                          ))
                    ],
                  )
                ]),
              ]),
            );
          },
        ),
      ),
    );
  }

  Icon setpasswordIcon() {
    if (obscure) {
      return const Icon(
        Icons.visibility,
        size: 24,
      );
    } else {
      return const Icon(Icons.visibility_off, size: 24);
    }
  }
}

import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/features/login/data/repos/login_repository_implementation.dart';
import 'package:fixer/features/login/manager/cubit/login_cubit.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_text_container.dart';
import 'package:fixer/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_buttons.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_forgotpass_row.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_logo.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_text_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<LoginRepositoryImplementation>()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            context.pushReplacementNamed(Routes.home);
          }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return ListView(children: [
            Column(children: [
              verticalSpace(50),
              const Logo(),
              verticalSpace(25),
              Text(S.of(context).welcome,
                  textAlign: TextAlign.center, style: TextStyles.headings),
              verticalSpace(25),
              TextContainer(
                text: S.of(context).userName,
                margin: 35,
              ),
              verticalSpace(10),
              TextForm(
                  controller: nameController,
                  text: S.of(context).enteryUserName,
                  obscure: false,
                  textInputType: TextInputType.name),

              verticalSpace(30),
              TextContainer(
                text: S.of(context).password,
                margin: 35,
              ),
              verticalSpace(10),
              //PASSWORD INPUT
              TextForm(
                controller: passwordController,
                text: S.of(context).passwordform,
                textInputType: TextInputType.text,
                obscure: obscure,
                icon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  child: setpasswordIcon(),
                ),
              ),
            ]),
            verticalSpace(5),
            const ForgotPassword(),
            verticalSpace(15),
            ButtonLogin(
              onSignInPressed: () {
                cubit.login(
                  nameController.text,
                  passwordController.text,
                  context
                );
              },
              onGooglePressed: () {
                cubit.signUpWithGoogle(context);
              },
            ),
            verticalSpace(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextContainer(
                  text: S.of(context).noaccount,
                  margin: 0,
                ),
                TextButton(
                    onPressed: () {
                      context.pushNamed(Routes.getStarted);
                    },
                    child: TextContainer(
                      text: S.of(context).signup,
                      color: ColorManager.primary,
                      margin: 0,
                    ))
              ],
            )
          ]);
        },
      ),
    );
  }

  Icon setpasswordIcon() {
    if (obscure) {
      return const Icon(Icons.visibility);
    } else {
      return const Icon(Icons.visibility_off);
    }
  }
}

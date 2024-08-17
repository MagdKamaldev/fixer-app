import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/features/user_sign_up/data/repos/user_signup_repository_implementation.dart';
import 'package:fixer/features/user_sign_up/manager/user_sign_up_cubit/user_sign_up_cubit.dart';
import 'package:fixer/features/user_sign_up/presentation/user_signup_layout/presentation/views/widgets/user_signup_layout_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSignUpView extends StatelessWidget {
  const UserSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserSignUpCubit(getIt<UserSignUpRepositoryImpelemntation>()),
      child: Scaffold(
        appBar: AppBar(),
        body: const UserSignUpBody(),
      ),
    );
  }
}

import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/user_sign_up/data/repos/user_signup_repository_implementation.dart';
import 'package:fixer/features/user_sign_up/manager/user_sign_up_cubit/user_sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:fixer/generated/l10n.dart';

class DoneAnimation extends StatefulWidget {
  final int page;
  const DoneAnimation({super.key, required this.page});

  @override
  State<DoneAnimation> createState() => _DoneAnimationState();
}

class _DoneAnimationState extends State<DoneAnimation> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserSignUpCubit(getIt<UserSignUpRepositoryImpelemntation>()),
      child: BlocConsumer<UserSignUpCubit, UserSignUpState>(
        listener: (context, state) {},
        builder: (context, state) => Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            children: [
              verticalSpace(50.h),
              Text(
                S.of(context).doneField,
                style: TextStyles.headings,
              ),
              verticalSpace(30.h),
              Lottie.asset("assets/animations/done.json"),
            ],
          ),
        ),
      ),
    );
  }
}

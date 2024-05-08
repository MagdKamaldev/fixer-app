import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/user_sign_up/data/repos/user_signup_repository_implementation.dart';
import 'package:fixer/features/user_sign_up/manager/user_sign_up_cubit/user_sign_up_cubit.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonSignUp extends StatelessWidget {
  final Function()? onPressed;
  final Function()? onGooglePressed;
  const ButtonSignUp(
      {super.key, this.pageController, this.onPressed, this.onGooglePressed});
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserSignUpCubit(getIt<UserSignUpRepositoryImpelemntation>()),
      child: BlocConsumer<UserSignUpCubit, UserSignUpState>(
        listener: (context, state) {},
        builder: (context, state) => Container(
          margin: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Column(
            children: [
              if (state is UserSignUpLoading)
                const Center(child: CircularProgressIndicator()),
              if (state is! UserSignUpLoading)
                ElevatedButton(
                  onPressed: () {
                    onPressed!();
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: ColorManager.primary,
                      minimumSize: Size.fromHeight(55.h)),
                  child: Text(
                    S.of(context).continuee,
                    style: TextStyle(
                        color: ColorManager.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              verticalSpace(10),
              Text(S.of(context).or, style: TextStyles.smallbold),
              verticalSpace(10),
              // google sign in
              if (state is GoogleSignUpLoading)
                const Center(child: CircularProgressIndicator()),

              if (state is! GoogleSignUpLoading)
                ElevatedButton(
                  onPressed: () {
                    onGooglePressed!();
                  },
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: ColorManager.primary),
                      shape: const StadiumBorder(),
                      backgroundColor: ColorManager.white,
                      minimumSize: Size.fromHeight(55.h)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/google_icon.png",
                          width: 20.w, height: 20.h),
                      horizontalSpace(15),
                      Text(S.of(context).signupwithgoogle,
                          style: TextStyles.smallbold),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

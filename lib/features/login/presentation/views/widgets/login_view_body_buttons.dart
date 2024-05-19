import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/login/manager/cubit/login_cubit.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonLogin extends StatelessWidget {
  final Function()? onSignInPressed;
  final Function()? onGooglePressed;
  const ButtonLogin({super.key, this.onSignInPressed, this.onGooglePressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Column(
            children: [
              if(state is LoginLoading)
              const Center(child: CircularProgressIndicator()),
              if(state is !LoginLoading)
              ElevatedButton(
                onPressed: () {
                  onSignInPressed!();
                },
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: ColorManager.primary,
                    minimumSize: Size.fromHeight(55.h)),
                child: Text(
                  S.of(context).signin,
                  style: TextStyle(
                      color: ColorManager.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              verticalSpace(10),
              Text(S.of(context).or, style: TextStyles.smallbold),
              verticalSpace(10),
              if(state is GoogleSignUpLoading)
              const Center(child: CircularProgressIndicator()),
              if(state is !GoogleSignUpLoading)
              ElevatedButton(
                onPressed: () {
                  onGooglePressed!();
                },
                style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: ColorManager.primary),
                    shape: const StadiumBorder(),
                    backgroundColor: ColorManager.white,
                    minimumSize: const Size.fromHeight(55)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/google_icon.png",
                        width: 20.w, height: 20.h),
                    horizontalSpace(15),
                    Text(S.of(context).withgoogle, style: TextStyles.smallbold),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/widgets/done_animation.dart';
import 'package:fixer/features/user_sign_up/data/repos/user_signup_repository_implementation.dart';
import 'package:fixer/features/user_sign_up/manager/user_sign_up_cubit/user_sign_up_cubit.dart';
import 'package:fixer/features/user_sign_up/presentation/user_phone_number/presentation/views/widgets/user_phone_number_body.dart';
import 'package:fixer/features/user_sign_up/presentation/user_signup_layout/presentation/views/widgets/signup_smoothpageindicator.dart';
import 'package:fixer/features/user_sign_up/presentation/user_signup_layout/presentation/views/widgets/user_address_view.dart';
import 'package:fixer/features/user_sign_up/presentation/view/user_signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UserSignUpBody extends StatefulWidget {
  const UserSignUpBody({super.key});

  @override
  State<UserSignUpBody> createState() => _UserSignUpBodyState();
}

class _UserSignUpBodyState extends State<UserSignUpBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserSignUpCubit(getIt<UserSignUpRepositoryImpelemntation>()),
      child: BlocConsumer<UserSignUpCubit, UserSignUpState>(
        listener: (context, state) {},
        builder: (context, state) {
          UserSignUpCubit cubit = UserSignUpCubit.get(context);
          return Center(
            child: ListView(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: SvgPicture.asset(
                      'assets/images/fixrpic.svg',
                      width: 134.85.w,
                      height: 91.h,
                    ),
                  ),
                  verticalSpace(30),
                  SmoothIndicatorUserSignup(controller: cubit.controller),
                  verticalSpace(10),
                  Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    height: 580.h,
                    width: 400.w,
                    child: PageView(
                      controller: cubit.controller,
                      onPageChanged: (int index) {
                        setState(() {});
                        cubit.controller.animateToPage(index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      children: [
                        cubit.is1Done
                            ? const DoneAnimation()
                            : UserPhoneNumberBody(
                                controller: cubit.controller,
                              ),
                        cubit.is2Done
                            ? const DoneAnimation()
                            : UserSignUpView(
                                controller: cubit.controller,
                              ),
                        cubit.is3Done
                            ? const DoneAnimation()
                            : const UserAddressView(),
                      ],
                    ),
                  )
                ],
              ),
            ]),
          );
        },
      ),
    );
  }
}

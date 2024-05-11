// ignore_for_file: unused_local_variable
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
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
import 'package:location/location.dart';

class UserSignUpBody extends StatefulWidget {
  const UserSignUpBody({super.key});

  @override
  State<UserSignUpBody> createState() => _UserSignUpBodyState();
}

class _UserSignUpBodyState extends State<UserSignUpBody> {
  Location location = Location();

  Future<void> requestLocationPermission() async {
    PermissionStatus permissionStatus;
    try {
      permissionStatus = await location.requestPermission();
    } catch (e) {
      debugPrint('Error requesting location permission: $e');
      return;
    }
  }

  @override
  void initState() {
    //request location acces here
    requestLocationPermission();
    super.initState();
  }

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
                  SmoothIndicatorUserSignup(controller: cubit.pageController),
                  verticalSpace(10),
                  Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    height: 580.h,
                    width: 400.w,
                    child: PageView(
                      controller: cubit.pageController,
                      onPageChanged: (int index) {
                        setState(() {});
                        cubit.pageController.animateToPage(index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      children: [
                        UserPhoneNumberBody(
                          controller: cubit.pageController,
                        ),
                        UserSignUpView(
                          controller: cubit.pageController,
                        ),
                        const UserAddressView(),
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

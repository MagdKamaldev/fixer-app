import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/features/user_sign_up/presentation/user_phone_number/presentation/views/widgets/user_phone_number_body.dart';
import 'package:fixer/features/user_sign_up/presentation/user_signup_layout/presentation/views/widgets/signup_smoothpageindicator.dart';
import 'package:fixer/features/user_sign_up/presentation/user_signup_layout/presentation/views/widgets/user_address_view.dart';
import 'package:fixer/features/user_sign_up/presentation/view/user_signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UserSignUpBody extends StatefulWidget {
  const UserSignUpBody({super.key});

  @override
  State<UserSignUpBody> createState() => _UserSignUpBodyState();
}

class _UserSignUpBodyState extends State<UserSignUpBody> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // verticalSpace(40),
            SizedBox(
              child: SvgPicture.asset(
                'assets/images/fixrpic.svg',
                width: 134.85.w,
                height: 91.h,
              ),
            ),
            verticalSpace(30),
            SmoothIndicatorUserSignup(controller: controller),
            verticalSpace(10),
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              height: 580.h,
              width: 400.w,
              child: PageView(
                controller: controller,
                onPageChanged: (int index) {
                  setState(() {});
                  controller.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                },
                children: [
                  UserSignUpView(
                    controller: controller,
                  ),
                  UserPhoneNumberBody(
                    controller: controller,
                  ),
                  const UserAddressView(),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}

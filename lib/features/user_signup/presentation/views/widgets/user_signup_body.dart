import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/features/phone_number/presentation/views/widgets/phone_number_body.dart';
import 'package:fixer/features/user_signup/presentation/views/widgets/on_boarding_smoothpageindicator.dart';
import 'package:fixer/features/user_signup/presentation/views/widgets/user_address_view.dart';
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
      child: ListView(
        children:[ Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(60),
            SizedBox(child: SvgPicture.asset('assets/images/fixrpic.svg',
            width: 134.85,
            height: 91,
            ),
            ),
            verticalSpace(30),
            SmoothIndicatorUserSignup(controller: controller),
            verticalSpace(15),
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              // padding: EdgeInsets.symmetric(horizontal:10.w,vertical: 20.h),
              // margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
              height: 580,
              width: 400,
              child: Padding(
                padding: EdgeInsets.only(top:15.h),
                child: PageView(
                  controller: controller ,
                  children:  const [
                     PhoneNumberBody(),
                     UserAddressView(),
                  ],
                ),
              ),
            )
        
        
        
          ],
        ),
      ]),
    );
  }
}
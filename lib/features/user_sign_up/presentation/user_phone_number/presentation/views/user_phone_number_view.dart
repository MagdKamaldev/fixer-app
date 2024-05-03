import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/features/user_sign_up/presentation/user_phone_number/presentation/views/widgets/user_phone_number_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserPhoneNumberView extends StatelessWidget {
  final PageController? controller;
  const UserPhoneNumberView({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              child: SvgPicture.asset(
                'assets/images/fixrpic.svg',
                width: 134.85,
                height: 91,
              ),
            ),
            verticalSpace(30),
            UserPhoneNumberBody(
              controller: controller!,
            ),
          ],
        ),
      ),
    );
  }
}

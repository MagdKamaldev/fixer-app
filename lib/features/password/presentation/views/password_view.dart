import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/features/password/presentation/views/widgets/password_body.dart';
import 'package:fixer/features/phone_number/presentation/views/widgets/phone_number_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordView extends StatelessWidget {
  const PasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
             SizedBox(child: SvgPicture.asset('assets/images/fixrpic.svg',
            width: 134.85,
            height: 91,
            ),
            ),
            verticalSpace(30),
            const PasswordBody(),
          
          ],
        ),
      ),
    );
  }
}

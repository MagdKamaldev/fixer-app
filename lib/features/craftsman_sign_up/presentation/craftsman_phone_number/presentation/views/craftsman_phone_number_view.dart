import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/craftsman_phone_number/presentation/views/widgets/phone_number_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CraftsmanPhoneNumberView extends StatelessWidget {
  const CraftsmanPhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            // verticalSpace(80),
             SizedBox(child: SvgPicture.asset('assets/images/fixrpic.svg',
            width: 134.85,
            height: 91,
            ),
            ),
            verticalSpace(30),
            const CraftsmanPhoneNumberBody(),
          
          ],
        ),
      ),
    );
  }
}

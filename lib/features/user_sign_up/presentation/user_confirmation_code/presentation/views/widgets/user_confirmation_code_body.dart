import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/networks/errors/error_snackbar.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/buttons/default_button.dart';
import 'package:fixer/features/user_sign_up/manager/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:fixer/features/user_sign_up/presentation/user_confirmation_code/presentation/views/widgets/text_buttons.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

String? otpCode;

class UserConfirmationCodeBody extends StatelessWidget {
  final PageController? controller;
  final String verificationId;
  const UserConfirmationCodeBody(
      {super.key, this.controller, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      BlocProvider(
        create: (context) => PhoneAuthCubit(),
        child: BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
          listener: (context, state) {},
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: SvgPicture.asset('assets/images/fixrpic.svg',
                    width: 134.85.w, height: 91.h),
              ),
              verticalSpace(20),
              Text(
                S.of(context).entercode,
                style: TextStyles.subHeadingsBold,
              ),
              verticalSpace(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(S.of(context).enteryourcode, style: TextStyles.body),
                  // Text()
                ],
              ),
              verticalSpace(35),
              Pinput(
                length: 6,
                showCursor: true,
                defaultPinTheme: PinTheme(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ColorManager.primary)),
                    textStyle: TextStyles.headings),
                onChanged: (value) {
                  otpCode = value;
                },
                onCompleted: (value) {
                  otpCode = value;
                },
                onSubmitted: (value) {
                  otpCode = value;
                },
              ),
              verticalSpace(100),
              if (state is PhoneAuthLoading)
                const Center(child: CircularProgressIndicator()),
              if (state is! PhoneAuthLoading)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: DefaultButton(
                      text: "Submit",
                      onPressed: () {
                        if (otpCode!.length != 6) {
                          showErrorSnackbar(
                              context, S.of(context).completeCode);
                        } else {
                          PhoneAuthCubit.get(context).verifyPhoneNumber(
                              verificationId, otpCode!, context);
                        }
                      }),
                ),
              verticalSpace(100),
              Text(S.of(context).after40sec, style: TextStyles.body),
              verticalSpace(15),
              ResendTextButton(text: S.of(context).resendcodeSMS),
            ],
          ),
        ),
      ),
    ]);
  }
}

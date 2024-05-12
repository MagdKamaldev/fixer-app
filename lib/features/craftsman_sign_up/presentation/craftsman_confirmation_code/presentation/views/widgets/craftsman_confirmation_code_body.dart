import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/networks/errors/error_snackbar.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/buttons/default_button.dart';
import 'package:fixer/features/craftsman_sign_up/manager/phone/craftsman_phone_cubit.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/craftsman_phone_number/presentation/views/widgets/phone_number_body.dart';
import 'package:fixer/features/user_sign_up/presentation/user_confirmation_code/presentation/views/widgets/text_buttons.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

String? craftsmanOtp = "";

class CraftsmanConfirmationCodeBody extends StatelessWidget {
  final String verificationId;
  const CraftsmanConfirmationCodeBody(
      {super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CraftsmanPhoneNumberCubit(),
      child: BlocConsumer<CraftsmanPhoneNumberCubit, CraftsmanPhoneNumberState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView(children: [
            Column(
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).enteryourcode, style: TextStyles.body),
                    verticalSpace(10),
                    Text(craftsmanPhoneNumber!,
                        style: TextStyles.headings
                            .copyWith(color: ColorManager.primary)),
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
                    craftsmanOtp = value;
                  },
                  onCompleted: (value) {
                    craftsmanOtp = value;
                  },
                  onSubmitted: (value) {
                    craftsmanOtp = value;
                  },
                ),
                verticalSpace(100),
                if (state is CraftsmanPhoneAuthLoading)
                const Center(child: CircularProgressIndicator()),
              if (state is! CraftsmanPhoneAuthLoading)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: DefaultButton(
                      text: "Submit",
                      onPressed: () {
                        if (craftsmanOtp!.length != 6) {
                          showErrorSnackbar(
                              context, S.of(context).completeCode);
                        } else {
                          CraftsmanPhoneNumberCubit.get(context).verifyPhoneNumber(
                              verificationId, craftsmanOtp!, context);
                        }
                      }),
                ),
                verticalSpace(100),
                Text(S.of(context).after40sec, style: TextStyles.body),
                verticalSpace(15),
                ResendTextButton(
                  text: S.of(context).resendcodeSMS,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ]);
        },
      ),
    );
  }
}

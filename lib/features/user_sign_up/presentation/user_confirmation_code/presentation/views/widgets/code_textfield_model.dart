import 'package:fixer/features/user_sign_up/manager/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String otp = "";

class UserTextFieldModel extends StatelessWidget {
  final bool? lastTextField;
  final String? verificationId;
  const UserTextFieldModel(
      {super.key, this.lastTextField, this.verificationId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhoneAuthCubit(),
      child: BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
        builder: (context, state) {
          return SizedBox(
            width: 60.w,
            height: 60.h,
            child: TextFormField(
              onChanged: (value) {
                otp += value;
                if (lastTextField == true) {
                  PhoneAuthCubit.get(context)
                      .verifyPhoneNumber(verificationId!, otp, context);
                }
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
                if (value.isEmpty) {
                  FocusScope.of(context).previousFocus();
                }
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                      borderSide: const BorderSide(width: 0.5))),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          );
        },
      ),
    );
  }
}

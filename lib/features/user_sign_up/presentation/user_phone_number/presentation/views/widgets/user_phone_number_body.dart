import 'package:country_picker/country_picker.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/arrow/presentation/views/phone_auth_arrow_button.dart';
import 'package:fixer/features/user_sign_up/manager/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:fixer/features/user_sign_up/manager/user_sign_up_cubit/user_sign_up_cubit.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String phoneNumber = "";

class UserPhoneNumberBody extends StatefulWidget {
  final PageController? controller;
  const UserPhoneNumberBody({super.key, this.controller});

  @override
  State<UserPhoneNumberBody> createState() => _UserPhoneNumberBodyState();
}

class _UserPhoneNumberBodyState extends State<UserPhoneNumberBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phonenumb = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: "+20",
    countryCode: "EG",
    e164Key: "+20",
    e164Sc: 20,
    geographic: true,
    level: 1,
    example: "Egypt",
    displayName: "Egypt",
    displayNameNoCountryCode: "EG",
    name: 'Egypt',
  );
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhoneAuthCubit(),
      child: BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
        listener: (context, state) {
          if (state is CodeSentSuccess) {
            widget.controller!.animateToPage(1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn);
            UserSignUpCubit.get(context).changePageState(1, true);
          }
        },
        builder: (context, state) => Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  S.of(context).phone,
                  style: TextStyles.bodybold,
                ),
              ),
              verticalSpace(20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                width: 385.w,
                height: 100.h,
                child: TextFormField(
                  controller: phonenumb,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your phone number";
                    } else if (value.length > 10 || value.length < 10) {
                      return "Please enter a valid phone number";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  style: TextStyles.smallHeadings,
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(vertical: 17.3.sp),
                        child: InkWell(
                          onTap: () {
                            showCountryPicker(
                              countryListTheme: CountryListThemeData(
                                  bottomSheetHeight: 500.h),
                              context: context,
                              showPhoneCode: true,
                              onSelect: (Country country) {
                                setState(() {
                                  selectedCountry = country;
                                });
                              },
                            );
                          },
                          child: Text(
                            "    ${selectedCountry.flagEmoji}  ${selectedCountry.phoneCode} ",
                            style: TextStyles.smallHeadings,
                          ),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide: BorderSide(
                              width: 1.sp, color: ColorManager.black)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide:
                            BorderSide(width: 1.sp, color: ColorManager.black),
                      )),
                ),
              ),
              verticalSpace(75),
              Align(
                alignment: Alignment.bottomRight,
                child: state is! PhoneAuthLoading
                    ? PhoneAuthArrowButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            phoneNumber = "${selectedCountry.phoneCode}${phonenumb.text}";
                            PhoneAuthCubit.get(context).signInWithPhoneNumber(
                                "${selectedCountry.phoneCode}${phonenumb.text}",
                                context);
                          }
                        },
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.w),
                        child: const CircularProgressIndicator(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:country_picker/country_picker.dart';
import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/arrow/presentation/views/phone_auth_arrow_button.dart';
import 'package:fixer/features/craftsman_sign_up/manager/phone/craftsman_phone_cubit.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String? craftsmanPhoneNumber = "";

class CraftsmanPhoneNumberBody extends StatefulWidget {
  const CraftsmanPhoneNumberBody({super.key});

  @override
  State<CraftsmanPhoneNumberBody> createState() =>
      _CraftsmanPhoneNumberBodyState();
}

class _CraftsmanPhoneNumberBodyState extends State<CraftsmanPhoneNumberBody> {
   final TextEditingController phonenumb = TextEditingController();
     GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
   
    return BlocConsumer<CraftsmanPhoneNumberCubit,CraftsmanPhoneNumberState>(
      listener: (context, state) {},
      builder:(context,state)=> Form(
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
                textDirection:
                    locale == "en" ? TextDirection.ltr : TextDirection.rtl,
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
                            countryListTheme:
                                CountryListThemeData(bottomSheetHeight: 500.h),
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
                        borderSide:
                            BorderSide(width: 1.sp, color: ColorManager.black)),
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
                child:state is! CraftsmanPhoneAuthLoading
                    ? PhoneAuthArrowButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            craftsmanPhoneNumber =
                                "${selectedCountry.phoneCode}${phonenumb.text}";
                            CraftsmanPhoneNumberCubit.get(context).signInWithPhoneNumber(
                                "${selectedCountry.phoneCode}${phonenumb.text}",
                                context);
                          }
                        },
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.w),
                        child: const CircularProgressIndicator(),
                      ),),
          ],
        ),
      ),
    );
  }
}

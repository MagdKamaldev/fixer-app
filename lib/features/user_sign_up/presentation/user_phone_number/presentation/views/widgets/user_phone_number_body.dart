import 'package:country_picker/country_picker.dart';
import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/core/widgets/arrow/presentation/views/arrow_button.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserPhoneNumberBody extends StatefulWidget {
  final PageController? controller;
  const UserPhoneNumberBody({super.key, this.controller});

  @override
  State<UserPhoneNumberBody> createState() => _UserPhoneNumberBodyState();
}

class _UserPhoneNumberBodyState extends State<UserPhoneNumberBody> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: locale == "en"
              ? EdgeInsets.only(right: 240.w)
              : EdgeInsets.only(left: 280.w),
          child: Text(
            S.of(context).phone,
            style: TextStyles.bodybold,
          ),
        ),
        verticalSpace(5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          width: 385.w,
          height: 55.h,
          child: TextFormField(
            controller: phonenumb,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your phone number";
              } else if (value.length > 9) {
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
        const ReusableArrowButton(nextPage: Routes.userConfirmationCode),
      ],
    );
  }
}

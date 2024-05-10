import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/models/location_model.dart';
import 'package:fixer/core/networks/errors/error_snackbar.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/user_sign_up/manager/user_sign_up_cubit/user_sign_up_cubit.dart';
import 'package:fixer/features/user_sign_up/presentation/user_signup_layout/presentation/views/widgets/address_botton.dart';
import 'package:fixer/features/user_sign_up/presentation/user_signup_layout/presentation/views/widgets/set_user_location.dart';
import 'package:fixer/features/user_sign_up/presentation/user_signup_layout/presentation/views/widgets/text_field_model.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:fixer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextEditingController areaControler = TextEditingController();

class UserAddressView extends StatefulWidget {
  const UserAddressView({super.key});

  @override
  State<UserAddressView> createState() => _UserAddressViewState();
}

class _UserAddressViewState extends State<UserAddressView> {
  @override
  void initState() {
    super.initState();
    if (areaControler.text == "") {
      areaControler.text = "Other";
    }
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController buildingControler = TextEditingController();
    TextEditingController apartmentControler = TextEditingController();
    TextEditingController floorControler = TextEditingController();
    TextEditingController streetControler = TextEditingController();
    TextEditingController cityControler = TextEditingController();
    TextEditingController additionalDirectionsControler =
        TextEditingController();
    return BlocConsumer<UserSignUpCubit, UserSignUpState>(
      listener: (context, state) {
        if (state is SetLocationSuccess) {
          context.pushNamed(Routes.home);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(20),
              Stack(
                  alignment: locale == "en"
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  children: [
                    AddressTextFieldModel(
                        controller: areaControler,
                        width: 380.w,
                        labeltext: S.of(context).area,
                        icons: const Icon(Icons.location_on_outlined)),
                    Padding(
                      padding: locale == "en"
                          ? EdgeInsets.only(right: 40.w)
                          : EdgeInsets.only(left: 40.w),
                      child: InkWell(
                          onTap: () {
                            context.pushNamed(Routes.setUserLocation);
                          },
                          child: Text(
                            S.of(context).change,
                            style: TextStyles.smallbold
                                .copyWith(color: ColorManager.primary),
                          )),
                    )
                  ]),
              verticalSpace(40),
              AddressTextFieldModel(
                  controller: buildingControler,
                  width: 380.w,
                  labeltext: S.of(context).building,
                  icons: const Icon(Icons.home_outlined)),
              verticalSpace(10),
              SizedBox(
                width: 385.w,
                height: 55.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AddressTextFieldModel(
                        controller: apartmentControler,
                        width: 165.w,
                        labeltext: S.of(context).Aptartment,
                        icons: const Icon(Icons.map_outlined)),
                    AddressTextFieldModel(
                        controller: floorControler,
                        width: 165.w,
                        labeltext: S.of(context).floor,
                        icons: const Icon(Icons.escalator_outlined)),
                  ],
                ),
              ),
              verticalSpace(10),
              AddressTextFieldModel(
                  controller: streetControler,
                  width: 380.w,
                  labeltext: S.of(context).street,
                  icons: const Icon(Icons.streetview)),
              verticalSpace(10),
              AddressTextFieldModel(
                  controller: cityControler,
                  width: 380.w,
                  labeltext: S.of(context).city,
                  icons: const Icon(Icons.location_city)),
              verticalSpace(10),
              AddressTextFieldModel(
                  controller: additionalDirectionsControler,
                  width: 380.w,
                  labeltext: S.of(context).aditionalDirections,
                  icons: const Icon(Icons.question_mark)),
              verticalSpace(60),
              if (state is SetLocationLocading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              if (state is! SetLocationLocading)
                GetStartedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate() &&
                        token != "" &&
                        lat != "" &&
                        long != "") {
                      UserSignUpCubit.get(context).setLocation(
                          LocationModel(
                            district: areaControler.text,
                            building: buildingControler.text,
                            additional: additionalDirectionsControler.text,
                            apartment: apartmentControler.text,
                            floor: floorControler.text,
                            lat: lat,
                            long: long,
                            city: cityControler.text,
                            street: streetControler.text,
                          ),
                          context);
                    } else if (token == "") {
                      showErrorSnackbar(context, S.of(context).signUpFirst);
                    } else if (lat == "" || long == "") {
                      showErrorSnackbar(
                          context, S.of(context).setLocationFirst);
                    }
                  },
                )
            ],
          ),
        );
      },
    );
  }
}

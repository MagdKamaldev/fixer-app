import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/user_signup/presentation/views/widgets/address_botton.dart';
import 'package:fixer/features/user_signup/presentation/views/widgets/text_field_model.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAddressView extends StatelessWidget {
  const UserAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(20),
          Stack(alignment:locale=="en"? Alignment.centerRight:Alignment.centerLeft,
            children:[ 
            AddressTextFieldModel(width:380.w,labeltext:S.of(context).area, icons: const Icon(Icons.location_on_outlined)),
            Padding(
              padding: locale=="en"? const EdgeInsets.only(right: 40):const EdgeInsets.only(left: 40),
              child: InkWell(
                onTap: () {
                  
                },
                child: Text(S.of(context).change,style: TextStyles.smallbold.copyWith(color: ColorManager.primary),)),
            )
            
            ]),
          verticalSpace(40),
          AddressTextFieldModel(width:380.w,labeltext: S.of(context).building, icons: const Icon(Icons.home_outlined)),
          verticalSpace(10),
          SizedBox(
            width: 385.w,
            height:55.h,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AddressTextFieldModel(width:165.w,labeltext: S.of(context).Aptartment, icons: const Icon(Icons.map_outlined )),
                AddressTextFieldModel(width:165.w,labeltext: S.of(context).floor, icons: const Icon(Icons.escalator_outlined)),
            
              ],
            ),
          ),
          verticalSpace(10),
          AddressTextFieldModel(width:380.w,labeltext: S.of(context).street, icons: const Icon(Icons.location_on_outlined)),
          verticalSpace(10),
          AddressTextFieldModel(width:380.w,labeltext:S.of(context).aditionalDirections, icons: const Icon(Icons.location_on_outlined)),
          verticalSpace(60),
          const GetStartedButton()


        ],
      );
  }
}
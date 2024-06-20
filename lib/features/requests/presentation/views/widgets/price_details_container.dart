import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Pricedetails extends StatelessWidget {
  const Pricedetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 235.h,
      padding: const EdgeInsets.only(top: 30,left: 24,right: 24,bottom: 24),
      color: ColorManager.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).pricedetails,style: TextStyles.bodybold,),
          verticalSpace(16),
          Expanded(
            child: SizedBox(
              height: 80.h,
              child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
              return  Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("service",style:TextStyles.small.copyWith(color: ColorManager.grey)),
                  Text("price LE",style:TextStyles.small.copyWith(color: ColorManager.grey))
                ],
                            ),
              );
                          },)),
          ),
          verticalSpace(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${S.of(context).subtotal} (EPG)",style:TextStyles.body.copyWith(color: ColorManager.grey)),
              Text("600 LE",style:TextStyles.body.copyWith(color: ColorManager.grey)),

            ],
          )
         
        ],
      ),
    );
  }
}
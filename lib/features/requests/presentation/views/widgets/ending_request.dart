import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/requests/presentation/views/widgets/price_details_container.dart';
import 'package:fixer/features/requests/presentation/views/widgets/request_details_container.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EndingRequest extends StatelessWidget {
  const EndingRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        surfaceTintColor: ColorManager.white,
        elevation: 0,
        toolbarOpacity:1.0 
      ),
      backgroundColor: ColorManager.greywhite,
      body: Column(
       children: [
       const Requestdetails(),
       verticalSpace(5),
       const Pricedetails(),
       verticalSpace(5),
       Container(
        width: MediaQuery.of(context).size.width,
        height: 111.h,
        padding: const EdgeInsets.only(top: 24,left: 24,right: 24,bottom: 24) ,
        color: ColorManager.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).yourtotal,style: TextStyles.smallHeadings.copyWith(color: ColorManager.black,fontWeight:FontWeight.w600),),
                Text("490 LE",style: TextStyles.body,),
              ],),
          MaterialButton(
            onPressed: () {},
            minWidth: 215.w,
            height: 47,
            color: ColorManager.primary,
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text(S.of(context).confirm,style:TextStyles.body.copyWith(color: ColorManager.white),),
            )
            
          ],
        ),
       )

       ])
    );
  }
}
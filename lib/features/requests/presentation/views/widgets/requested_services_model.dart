import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestedServicesmodel extends StatelessWidget {
  const RequestedServicesmodel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.w,
      height: 45.h,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.category_outlined,size: 25,color: ColorManager.primary,),
          horizontalSpace(10),
          Text("category",style: TextStyles.body,),
          horizontalSpace(5),
          Text("-",style: TextStyles.body,),
          horizontalSpace(5),
          Text("service",style: TextStyles.body,),
          horizontalSpace(130),
          const Icon(Icons.close_rounded,color:ColorManager.primary ,size: 25,)
        ],
      ),
    );
  }
}
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailableCraftmenCard extends StatelessWidget {
  const AvailableCraftmenCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.w,
      height: 108.h,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorManager.lightblue),
        color: ColorManager.greywhite,
        boxShadow: const [
              BoxShadow(
                color: ColorManager.babyblue,
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/profile_photo.png",height:50,width:50),
          horizontalSpace(10),
          SizedBox(
            width: 250,
            height:90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 34,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("user name",style:TextStyles.body,),
                      Row( children: [
                                  const Icon(Icons.star,color: Colors.yellow,size:20,),
                                  Text("rate",style: TextStyles.small,)
                                ],
                              )
                    ],
                  ),
                ),
                
                Row(   
            mainAxisAlignment: MainAxisAlignment.spaceBetween,        
            children: [
              MaterialButton(
                onPressed: () {
                 
                },
              color: ColorManager.primary,
              height: 30.h,
              minWidth: 115.w,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Text("confirm",style: TextStyles.body.copyWith(color: ColorManager.white),),
              ),
              MaterialButton(
            onPressed: () {},
                    color: ColorManager.white,
                    height: 30.h,
                    minWidth: 115.w,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Text("skip ",style: TextStyles.body.copyWith(color: ColorManager.primary),),
                    ),
            ],
                    ),  
              ],    
            ),
          ),
          
        ],
      ),
    );
  }
}
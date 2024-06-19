import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/requests/presentation/views/widgets/google_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmLocation extends StatelessWidget {
  const ConfirmLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Edit your location",style: TextStyles.bodybold,),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const GoogleMapView(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 95,
            color: ColorManager.white,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: MaterialButton(
              onPressed: () {},
                      color: ColorManager.primary,
                      height: 50.h,
                      minWidth: 330.w,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Text("confirm location",style: TextStyles.body.copyWith(color: ColorManager.white),),
                      ),
          ),
        ],
      ),
    );
  }
}
import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/features/stores/presentation/views/widgets/stores_tab_view.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoresBody extends StatelessWidget {
  const StoresBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20,left: 15,right:15 ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 350.w,
                height: 51.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8 ),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: S.of(context).search,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(10),
                        ),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Align(alignment: Alignment.centerRight,
                child: Container(
                  width: 60.w,
                  height: 51.h,
                  decoration: const BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius:locale == "en" ? 
                  BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8))
                :BorderRadius.only(bottomLeft: Radius.circular(8),topLeft: Radius.circular(8))),
                ),
              ),
                        IconButton(
                          icon: const Icon(Icons.search,color:ColorManager.white,),
                          onPressed: () {
                            // Handle search icon press
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              verticalSpace(10),
              SizedBox(
                width: 350.w,
                height:96*6.h ,
                child: const Storestab())
              
            ],
          ),
        ),
      );
  }
}
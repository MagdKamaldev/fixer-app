import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/features/home/presentation/views/widgets/stores_tab_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoresBody extends StatelessWidget {
  const StoresBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body:Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 380,
                height: 41,
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
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Align(alignment: Alignment.centerRight,
                child: Container(
                  width: 60,
                  height: 41,
                  decoration: const BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8)),
                ),
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
              Container(
                width: 350.w,
                height:515.h ,
                child: Storestab())
              
            ],
          ),
        ),
      ),
    );
  }
}
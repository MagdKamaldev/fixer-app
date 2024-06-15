import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchbarContainer extends StatelessWidget {
  const SearchbarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                width: 340.w,
                height: 45.h,
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
                          hintStyle: const TextStyle(color: ColorManager.grey),
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
              );
  }
}
import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/features/home/presentation/views/widgets/service_tab_view.dart';
import 'package:fixer/features/home/presentation/views/widgets/stores_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarConatiner extends StatelessWidget {
  const TabBarConatiner({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Row(children:[
                        const SizedBox(
                          width: 200, // Width for both tabs (50 each)
                          child: TabBar(
                            labelColor:ColorManager.primary,
                            unselectedLabelColor:ColorManager.grey,
                            indicatorColor: ColorManager.primary,
                            dividerHeight: 0,
                            indicatorWeight: 2,
                            indicator: UnderlineTabIndicator(
                              borderSide: BorderSide(width: 4.0, color:ColorManager.primary), // Change the width and color of the indicator // Adjust the insets as needed
                            ),
                            tabs: [
                              SizedBox(
                                width: 100,
                                child: Tab(text: 'Services',),
                              ),
                              SizedBox(
                                width: 100,
                                child: Tab(text: 'Stores'),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(), // Pushes the "View All" text to the end of the row
                        TextButton(
                          onPressed: () {
                            context.pushNamed(Routes.StoresBody);
                          },
                          child: const Text(
                            'View All',
                            style: TextStyle(color:ColorManager.black,decoration: TextDecoration.underline,decorationThickness: 2 ),
                          ),
                        ),
                      ],
                    ),
                  Container(
                    width: 350.w,
                    height: 210.h,
                    child: const TabBarView(
          children: [
            ServiceTab(),
            Storestab()
          ],
        ),
                  )
                    
        ],
      
        
      ),
    );
  }
}
import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/features/home/presentation/views/widgets/service_tab_view.dart';
import 'package:fixer/features/home/presentation/views/widgets/stores_tab_view.dart';
import 'package:fixer/generated/l10n.dart';
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
                        SizedBox(
                          width: 200, // Width for both tabs (50 each)
                          child: TabBar(
                            labelColor:ColorManager.primary,
                            unselectedLabelColor:ColorManager.grey,
                            indicatorColor: ColorManager.primary,
                            dividerHeight: 0,
                            indicatorWeight: 2,
                            indicator: const UnderlineTabIndicator(
                              borderSide: BorderSide(width: 4.0, color:ColorManager.primary), // Change the width and color of the indicator // Adjust the insets as needed
                            ),
                            tabs: [
                              SizedBox(
                                width: 100,
                                child: Tab(text:S.of(context).services),
                              ),
                              SizedBox(
                                width: 100,
                                child: Tab(text:S.of(context).Stores),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(), // Pushes the "View All" text to the end of the row
                        TextButton(
                          onPressed: () {
                            context.pushNamed(Routes.storesviewAll);
                          },
                          child: Text(S.of(context).viewAll,
                            style: const TextStyle(color:ColorManager.black,decoration: TextDecoration.underline,decorationThickness: 2 ),
                          ),
                        ),
                      ],
                    ),
                  verticalSpace(10),  
                  SizedBox(
                    width: 350.w,
                    height: 96*2.h,
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
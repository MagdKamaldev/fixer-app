import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/home/presentation/views/widgets/request_now_container.dart';
import 'package:fixer/features/home/presentation/views/widgets/tab_bar.dart';
import 'package:fixer/features/home/presentation/views/widgets/welcome_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WelcomeContainer(),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Request Service",style: TextStyles.headings,),
                verticalSpace(6),
                const RequestNowContainer(),
                verticalSpace(6),
                const TabBarConatiner() 
              ],
            ),
          ),
        )
          
      ],
    );
  }
}
import 'package:fixer/features/on_boarding/presentation/views/widgets/on_boarding_arrowBotton.dart';
import 'package:fixer/features/on_boarding/presentation/views/widgets/on_boarding_skipBotton.dart';
import 'package:fixer/features/on_boarding/presentation/views/widgets/on_boarding_smoothpageindicator.dart';
import 'package:fixer/features/on_boarding/presentation/views/widgets/onboarding_container.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {

  PageController controller=PageController();
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        PageView(
        controller: controller,  
        children: [
        onBoardingContainer(
        image:"assets/images/onbaording1.png", 
        text:"Connect users with skilled \n craftsmen instantly.",
        ),
       onBoardingContainer(
        image:"assets/images/onboarding2.png", 
        text:"Recieve competitive bids,\ncompare prices,and make \n informed decisions.",
        ),
        onBoardingContainer(
        image:"assets/images/onboarding3.png", 
        text:"Make hassle-free transcations \n within the app fpr peace of\n mind.",
        ),
      ],
      ),
        skipBotton(controller: controller,),
        Container(
        padding: const EdgeInsets.only(bottom: 60,left: 60,right: 60),
        alignment: Alignment.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            smooth_page_indicator(controller: controller),
            on_boarding_arrow(controller: controller,),
          ],
        ))
    ]);
  }
}
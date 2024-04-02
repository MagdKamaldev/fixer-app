import 'package:fixer/features/on_boarding/presentation/views/widgets/on_boarding_arrow_botton.dart';
import 'package:fixer/features/on_boarding/presentation/views/widgets/on_boarding_skip_button.dart';
import 'package:fixer/features/on_boarding/presentation/views/widgets/on_boarding_smoothpageindicator.dart';
import 'package:fixer/features/on_boarding/presentation/views/widgets/onboarding_container.dart';
import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController controller = PageController();
  bool onlastpage = false;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            onlastpage = (index == 2);
            // turn into true
          });
        },
        children: const [
          OnBoardingContainer(
            image: "assets/images/onboarding1.svg",
            text: "Connect users with skilled \n craftsmen instantly.",
          ),
          OnBoardingContainer(
            image: "assets/images/onboarding2.svg",
            text:
                "Recieve competitive bids,\ncompare prices,and make \n informed decisions.",
          ),
          OnBoardingContainer(
            image: "assets/images/onboarding3.svg",
            text:
                "Make hassle-free transcations \n within the app fpr peace of\n mind.",
          ),
        ],
      ),
      SkipBotton(
        controller: controller,
      ),
      Container(
          padding: const EdgeInsets.only(bottom: 60, left: 60, right: 60),
          alignment: Alignment.bottomLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmoothPageIndicatorWidget(controller: controller),
              OnBoardingArrow(
                controller: controller,
                onlastPage: onlastpage,
              ),
            ],
          ))
    ]);
  }
}

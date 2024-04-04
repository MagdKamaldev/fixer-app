import 'package:fixer/features/on_boarding/presentation/views/widgets/on_boarding_arrow_botton.dart';
import 'package:fixer/features/on_boarding/presentation/views/widgets/on_boarding_skip_button.dart';
import 'package:fixer/features/on_boarding/presentation/views/widgets/on_boarding_smoothpageindicator.dart';
import 'package:fixer/features/on_boarding/presentation/views/widgets/onboarding_container.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
        children:[
          OnBoardingContainer(
            image: "assets/images/onboarding1.svg",
            text: S.of(context).onBoardingText1,
          ),
          OnBoardingContainer(
            image: "assets/images/onboarding2.svg",
            text: S.of(context).onBoardingText2,
          ),
          OnBoardingContainer(
            image: "assets/images/onboarding3.svg",
            text: S.of(context).onBoardingText3,
          ),
        ],
      ),
      SkipBotton(
        controller: controller,
      ),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 60.h,vertical: 60.w),
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

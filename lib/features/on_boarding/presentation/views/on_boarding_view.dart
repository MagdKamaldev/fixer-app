import 'package:fixer/features/on_boarding/presentation/views/widgets/on_boarding_view_body.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    //context.pushReplacementNamed(Routes.login);
    return const Scaffold(
      //TODO: implement onBoarding UI
      body: OnBoardingViewBody(),
    );
  }
}

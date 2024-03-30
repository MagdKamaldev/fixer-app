import 'package:fixer/features/on_boarding/presentation/views/widgets/on_boarding_view_body.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding Screen'),
      ),
      body: OnBoardingViewBody(),
    );
  }
}
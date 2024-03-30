import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        // Add your onboarding content here
        child: Center(
          child: Text(
            'Welcome to the Onboarding Screen!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
  }
}
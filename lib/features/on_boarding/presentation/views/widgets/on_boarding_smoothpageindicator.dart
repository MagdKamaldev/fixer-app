import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class smooth_page_indicator extends StatelessWidget {
  
  PageController controller;
  smooth_page_indicator({required this.controller});
  @override
  Widget build(BuildContext context) {
    return  SmoothPageIndicator(
              controller: controller, count:3 ,
              effect: const ExpandingDotsEffect(
                activeDotColor: Color(0xff303564),
                dotColor: const Color(0xffC4C4C4),
              ),
              );
  }
}
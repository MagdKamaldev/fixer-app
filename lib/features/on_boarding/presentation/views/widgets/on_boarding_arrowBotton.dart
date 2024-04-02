
import 'package:flutter/material.dart';

class on_boarding_arrow extends StatelessWidget {

  PageController controller;
  on_boarding_arrow({required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.nextPage(duration: Duration(microseconds:500 ),
         curve:Curves.easeIn);
      },
      child: Container(
                width: 71,
                height: 71,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff303564),),
                child: const ImageIcon(AssetImage("assets/images/ph_arrow-up-thin.png"),
                color: Colors.white,)
                ),
    ) ;
  }
}
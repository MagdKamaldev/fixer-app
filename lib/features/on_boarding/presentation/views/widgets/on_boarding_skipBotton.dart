import 'package:fixer/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

class skipBotton extends StatelessWidget {
  PageController controller;
  skipBotton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushReplacementNamed('/login');
      },
      child: Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.only(right: 40,top: 70),
            child: Text("Skip",style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Color(0xff888787),
          ),),),
    );
  }
}
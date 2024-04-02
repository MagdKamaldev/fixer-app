import 'package:fixer/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class skipBotton extends StatefulWidget {
  PageController controller;
  skipBotton({required this.controller});

  @override
  State<skipBotton> createState() => _skipBottonState();
}

class _skipBottonState extends State<skipBotton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushReplacementNamed('/login');
      },
      child: Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.only(right: 40,top: 70),
            child: Text("Skip",style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Color(0xff888787),
          ),),),
    );
  }
}
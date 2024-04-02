import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class onBoardingContainer extends StatelessWidget {

   String image;
   String text;
   onBoardingContainer({required this.image,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
     color: const Color.fromARGB(255, 255, 255, 255),
     child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
       Container(
        child:Image.asset("$image")
        ),
       Container(
        padding: EdgeInsets.only(top: 40),
        child: Text("$text",
        textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            color: Color(0xFF000000),
            fontWeight:FontWeight.w500,
            fontSize:24
           )
          ),
        )
      ],
     ),
    );

  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextContainer extends StatelessWidget {
  final String text;
  final Color? color;
  final double margin;
  const TextContainer({super.key, required this.text,this.color,required this.margin});
  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.only(left:margin),
          alignment: Alignment.topLeft,
          child: Text(text,
              textAlign: TextAlign.start,
              style: GoogleFonts.roboto(
                color: const Color(0xff1E1E1E),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
        );
  }
}
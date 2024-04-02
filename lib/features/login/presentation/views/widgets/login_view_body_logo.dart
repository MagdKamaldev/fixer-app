// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(children: [
        Image.asset(
          "assets/images/login/Group_22.png",
          width: 125,
          height: 89,
        ),
        Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Image.asset("assets/images/fixr_logo.png",
                width: 134.85, height: 56.92))
      ]),
      const SizedBox(height: 40),
      Text("Welcome Back!",
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            color: const Color(0xff1E1E1E),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ))
    ]);
  }
}

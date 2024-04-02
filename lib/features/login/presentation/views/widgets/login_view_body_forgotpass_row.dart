import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 35),
        child: Row(children: [
          const Checkbox(
              value: false, onChanged: null, checkColor: Color(0XFF303564)),
          Text("Remember me",
              style: GoogleFonts.roboto(
                  color: const Color(0xff1E1E1E),
                  fontSize: 14,
                  fontWeight: FontWeight.w500)),
          const SizedBox(width: 60),
          TextButton(
              onPressed: () {},
              child: Text("Forgot Password",
                  style: GoogleFonts.roboto(
                    color: const Color(0xff1E1E1E),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )))
        ]));
  }
}

import 'package:fixer/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 35),
        child: Row(children: [
          Checkbox(
            value: isSelected,
            onChanged: (bool? selection) {
              setState(() {
                isSelected = !isSelected;
              });
            },
            checkColor: ColorManager.primary,
            activeColor: ColorManager.white,
            focusColor: ColorManager.black,
          ),
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

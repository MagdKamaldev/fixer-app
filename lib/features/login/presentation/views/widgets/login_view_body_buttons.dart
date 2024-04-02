import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              debugPrint("Email : ${emailController.text}");
              debugPrint("Password : ${passwordController.text}");
            },
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: const Color(0xff303564),
                minimumSize: const Size.fromHeight(55)),
            child: const Text(
              "Sign in",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Or",
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Color(0XFF303564)),
                shape: const StadiumBorder(),
                backgroundColor: Colors.white,
                minimumSize: const Size.fromHeight(55)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/google icon.png"),
                const SizedBox(width: 15),
                const Text(
                  "Sign in with Google",
                  style: TextStyle(
                      color: Color(0xff1A1C1E),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Container(
      margin: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              debugPrint("Email : ${emailController.text}");
              debugPrint("Password : ${passwordController.text}");
            },
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: ColorManager.primary,
                minimumSize: Size.fromHeight(55.h)),
            child: Text(
              "Sign in",
              style: TextStyle(
                  color: ColorManager.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          verticalSpace(10),
          const Text(
            "Or",
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          verticalSpace(10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                side: const BorderSide(color: ColorManager.primary),
                shape: const StadiumBorder(),
                backgroundColor: Colors.white,
                minimumSize: const Size.fromHeight(55)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/google_icon.png",
                    width: 20.w, height: 20.h),
                horizontalSpace(15),
                Text(
                  "Sign in with Google",
                  style: TextStyle(
                      color: ColorManager.black,
                      fontSize: 16.sp,
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

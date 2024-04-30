import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonSignUp extends StatelessWidget {
  const ButtonSignUp({super.key, this.controller});
  final PageController? controller;

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Container(
      margin: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              controller!.nextPage(
                  duration: const Duration(microseconds: 500),
                  curve: Curves.easeIn);
              // context.pushNamed(Routes.userphoneNumber);
              debugPrint("Email : ${emailController.text}");
              debugPrint("Password : ${passwordController.text}");
              debugPrint("Name : ${nameController.text}");
            },
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: ColorManager.primary,
                minimumSize: Size.fromHeight(55.h)),
            child: Text(
              S.of(context).signup,
              style: TextStyle(
                  color: ColorManager.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          verticalSpace(10),
          Text(S.of(context).or, style: TextStyles.smallbold),
          verticalSpace(10),
          // google sign in
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                side: const BorderSide(color: ColorManager.primary),
                shape: const StadiumBorder(),
                backgroundColor: ColorManager.white,
                minimumSize: Size.fromHeight(55.h)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/google_icon.png",
                    width: 20.w, height: 20.h),
                horizontalSpace(15),
                Text(S.of(context).signupwithgoogle,
                    style: TextStyles.smallbold),
              ],
            ),
          )
        ],
      ),
    );
  }
}
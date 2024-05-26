import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/screens/reviewing_screen.dart';
import 'package:fixer/features/login/data/repos/login_repository_implementation.dart';
import 'package:fixer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DrawerHeader(
                  child: SvgPicture.asset("assets/images/fixr_logo.svg")),
              verticalSpace(20),
              ListTile(
                title: Row(
                  children: [
                    Text(
                      "Complains",
                      style: TextStyles.lightHeadings,
                    ),
                    const Spacer(),
                    const Icon(Icons.error_outline)
                  ],
                ),
                onTap: () {
                  context.pushNamed(Routes.complains);
                },
              ),
              verticalSpace(20),
              ListTile(
                title: Row(
                  children: [
                    Text(
                      "Logout",
                      style: TextStyles.lightHeadings,
                    ),
                    const Spacer(),
                    const Icon(Icons.logout)
                  ],
                ),
                onTap: () async {
                  token = "";
                  await kTokenBox.delete(kTokenBoxString);
                  context.pushReplacementNamed(Routes.login);
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(),
      body: isPending
          ? const ReviewingBody()
          : const Center(child: Text('Home View')),
    );
  }
}

import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:fixer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                    S.of(context).complains,
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
                    S.of(context).logout,
                    style: TextStyles.lightHeadings,
                  ),
                  const Spacer(),
                  const Icon(Icons.logout)
                ],
              ),
              onTap: () async {
                token = "";
                kTokenBox.put(kTokenBoxString, token);
                context.pushReplacementNamed(Routes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}

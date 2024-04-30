import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/routing/routes.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_logo.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FieldOfServiceBody extends StatelessWidget {
  const FieldOfServiceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        verticalSpace(5),
        const Logo(),
        verticalSpace(30),
        Text(
          S.of(context).field,
          style: TextStyles.subHeadingsBold,
        ),
        verticalSpace(30),
        GestureDetector(
            onTap: () {
              context.pushNamed(Routes.uploadPhotos);
            },
            child: SvgPicture.asset("assets/images/Electrical_card.svg",
            height: 180.h,
            width:150.w ,
            )),
        verticalSpace(40),
        GestureDetector(
            onTap: () {
              context.pushNamed(Routes.uploadPhotos);
            },
            child: SvgPicture.asset("assets/images/plumbing_card.svg",
            height: 180.h,
            width: 150.w,
            ))
      ]),
    );
  }
}

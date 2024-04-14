import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_logo.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            onTap: () {},
            child: SvgPicture.asset("assets/images/Electrical card.svg")),
        verticalSpace(40),
        GestureDetector(
            onTap: () {},
            child: SvgPicture.asset("assets/images/plumbing card.svg"))
      ]),
    );
  }
}

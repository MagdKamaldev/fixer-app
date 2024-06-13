import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/home/presentation/profile_view/presentation/views/widgets/profile_picture_container.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class StackConatiner extends StatelessWidget {
  const StackConatiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
            Container(
              height: 150.h,
              width:MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SvgPicture.asset("assets/images/two_waves.svg")),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SvgPicture.asset("assets/images/one_wave.svg")),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(S.of(context).Profile,style: TextStyles.normal.copyWith(color: ColorManager.white))),
                  
                ],
              ),
            ),
          const Align(
            alignment: Alignment.center,
            child: ProfilePictureContainer())

          ],
    );
  }
}
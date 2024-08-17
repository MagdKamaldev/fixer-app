import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CancelRequestBottomSheet extends StatelessWidget {
  final String message;
  const CancelRequestBottomSheet({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 380.h,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 42),
      decoration: const BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/uncovered_area.svg",
            height: 110.h,
            width: 177.w,
          ),
          verticalSpace(30),
          SizedBox(
            width: size.width * 0.8,
            child: Text(
              message,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyles.bodybold,
            ),
          ),
          verticalSpace(30),
          MaterialButton(
            onPressed: () {
              context.pushReplacementNamed(Routes.home);
            },
            color: ColorManager.primary,
            height: 50.h,
            minWidth: 150.w,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text(
              S.of(context).cancelrequest,
              style: TextStyles.body.copyWith(color: ColorManager.white),
            ),
          ),
        ],
      ),
    );
  }
}

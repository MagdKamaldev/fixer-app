import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/craftsman_sign_up/manager/craftsman_sign_up_cubit/craftsman_sign_up_cubit.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackId extends StatelessWidget {
  const BackId({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: Text(
                S.of(context).uploadOptions,
                style: TextStyles.bodybold,
              ),
              content: SingleChildScrollView(
                child: Row(
                  children: [
                    GestureDetector(
                      child: Column(
                        children: [
                          verticalSpace(30),
                          Text(
                            S.of(context).camera,
                            style: TextStyles.headings,
                          ),
                          verticalSpace(10),
                          SizedBox(
                              height: 80.h,
                              width: 80.w,
                              child: Image.asset("assets/images/camera.png")),
                        ],
                      ),
                      onTap: () {
                        // Handle camera upload
                        CraftsmanSignUpCubit.get(context)
                            .getbackImagefromCamera(context);
                      },
                    ),
                    horizontalSpace(50),
                    GestureDetector(
                      child: Column(
                        children: [
                          verticalSpace(30),
                          Text(
                            S.of(context).gallery,
                            style: TextStyles.headings,
                          ),
                          verticalSpace(10),
                          SizedBox(
                              height: 80.h,
                              width: 80.w,
                              child: Image.asset("assets/images/gallery.png")),
                        ],
                      ),
                      onTap: () {
                        CraftsmanSignUpCubit.get(context)
                            .getbackImagefromGallery(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Column(
        children: [
          Text(
            S.of(context).uploadBack,
            style: TextStyles.bodybold,
          ),
        ],
      ),
    );
  }
}
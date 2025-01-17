import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/home/presentation/home_view/presentation/views/widgets/request_pop_up.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestNowContainer extends StatelessWidget {
  const RequestNowContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350.w,
        height: 167.h,
        decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    const AssetImage("assets/images/requestnow_backgroung.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    ColorManager.primary.withOpacity(0.65), BlendMode.srcOver)),
            color: ColorManager.primary,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).yourfixOurExpertise,
              style: TextStyles.lightHeadings.copyWith(
                  color: ColorManager.white, fontWeight: FontWeight.w700),
            ),
            verticalSpace(20),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const RequestPopUp();
                  },
                );
              },
              child: InkWell(
                child: Container(
                  alignment: Alignment.center,
                  width: 150.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: ColorManager.white, width: 0.5)),
                  child: Text(
                    S.of(context).requestnow,
                    style: TextStyles.smallHeadings
                        .copyWith(color: ColorManager.white),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

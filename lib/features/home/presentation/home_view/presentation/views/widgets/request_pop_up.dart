import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/routing/app_router.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/home/presentation/home_view/presentation/views/widgets/services_container_model.dart';
import 'package:fixer/features/services/presentation/view/services_view.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestPopUp extends StatelessWidget {
  const RequestPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        width: 380.w,
        height: 213.h,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Text(
              S.of(context).whichservicedoyouliketorequest,
              style: TextStyles.small,
            ),
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      navigateTo(
                          context,
                          ServicesView(
                            id: 14,
                            category: S.of(context).plumbing,
                          ));
                    },
                    child: const ServicesContainerModel(
                        image: "assets/images/plumbing_card.svg")),
                horizontalSpace(10),
                InkWell(
                    onTap: () {
                      navigateTo(
                          context,
                          ServicesView(
                            id: 16,
                            category:S.of(context).electric,
                          ));
                    },
                    child: const ServicesContainerModel(
                        image: "assets/images/Electrical_card.svg"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

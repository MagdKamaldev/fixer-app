
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopUpMessage extends StatelessWidget {
  const PopUpMessage ({super.key});

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
        width: 350.w, 
        height: 180.h, 
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.close,size: 20,),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ],
            ),
            Text(
              S.of(context).doyouwanttorequestservice,
              style: TextStyles.small,
            ),
            verticalSpace(20),
            MaterialButton(
            onPressed: () {},
            color: ColorManager.primary,
            height: 40,
            minWidth: 110,
            textColor: ColorManager.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text(S.of(context).requestnow),
            )
          ],
        ),
      ),
    )
    ;
  }
}
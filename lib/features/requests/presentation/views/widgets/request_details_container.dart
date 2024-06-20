import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/requests/presentation/views/widgets/request_row_model.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Requestdetails extends StatelessWidget {
  const Requestdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 243.h,
        padding:
            const EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 20),
        color: ColorManager.white,
        child: Container(
          color: Colors.white,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  S.of(context).requestdetails,
                  style: TextStyles.bodybold,
                ),
                verticalSpace(25),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://th.bing.com/th?id=OIP.TctatNGs7RN-Dfc3NZf91AAAAA&w=212&h=212&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2"),
                        radius: 25,
                      ),
                      Container(
                        width: 260.w,
                        height: 65.h,
                        color: Colors.white,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "name",
                                style: TextStyles.body,
                              ),
                              verticalSpace(6),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 20,
                                  ),
                                  horizontalSpace(2),
                                  Text(
                                    "1",
                                    style: TextStyles.body,
                                  ),
                                  horizontalSpace(5),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "(200 ${S.of(context).services})",
                                      style: TextStyles.small.copyWith(
                                        color: ColorManager.grey,
                                        decoration: TextDecoration.underline,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        decorationColor: ColorManager.grey,
                                        // fontSize: 14
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ]),
                      )
                    ]),
                Container(
                    color: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.h, vertical: 14.w),
                    child: RequestRowModel(
                        label: S.of(context).area,
                        description: "description",
                        icon: Icons.location_on_outlined))
              ]),
        ));
  }
}

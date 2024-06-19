import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/requests/data/models/order_carftsmen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailableCraftmenCard extends StatelessWidget {
  final OrderCarftsmenModel model;
  const AvailableCraftmenCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.w,
      height: 120.h,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorManager.lightblue),
        color: ColorManager.greywhite,
        boxShadow: const [
          BoxShadow(
            color: ColorManager.babyblue,
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(model.profilePic ??
                    "https://th.bing.com/th?id=OIP.TctatNGs7RN-Dfc3NZf91AAAAA&w=212&h=212&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2"),
                radius: 30,
              ),
              verticalSpace(15),
              Text(
                "${model.fair} EGP",
                style: TextStyles.bodybold,
              ),
            ],
          ),
          horizontalSpace(20),
          SizedBox(
            width: 200.w,
            height: 110.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.name!,
                      style: TextStyles.body,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        Text(
                          model.rating.toString(),
                          style: TextStyles.small,
                        )
                      ],
                    )
                  ],
                ),
                verticalSpace(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      color: ColorManager.primary,
                      height: 30.h,
                      minWidth: 85.w,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "confirm",
                        style:
                            TextStyles.body.copyWith(color: ColorManager.white),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: ColorManager.white,
                      height: 30.h,
                      minWidth: 85.w,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "skip ",
                        style: TextStyles.body
                            .copyWith(color: ColorManager.primary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

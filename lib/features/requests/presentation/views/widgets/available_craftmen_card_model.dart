// ignore_for_file: use_build_context_synchronously, must_be_immutable
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/networks/errors/error_snackbar.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/requests/data/models/order_carftsmen_model.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class AvailableCraftmenCard extends StatefulWidget {
  final OrderCarftsmenModel model;

  const AvailableCraftmenCard({super.key, required this.model});

  @override
  State<AvailableCraftmenCard> createState() => _AvailableCraftmenCardState();
}

class _AvailableCraftmenCardState extends State<AvailableCraftmenCard> {
  bool isCalled = false;

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
                backgroundImage: NetworkImage(widget.model.profilePic ??
                    "https://th.bing.com/th?id=OIP.TctatNGs7RN-Dfc3NZf91AAAAA&w=212&h=212&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2"),
                radius: 30,
              ),
              verticalSpace(15),
              Text(
                "${widget.model.fair} EGP",
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
                      widget.model.name!,
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
                          widget.model.rating.toString(),
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
                      onPressed: () {
                        makePhoneCall(widget.model.phone!, context);
                      },
                      color: ColorManager.primary,
                      height: 30.h,
                      minWidth: 85.w,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        isCalled ? "confirm" : "call",
                      
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
                        S.of(context).skip,
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

  Future<void> makePhoneCall(String phoneNumber, BuildContext context) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunch(launchUri.toString())) {
      await launch(launchUri.toString());
      setState(() {
        isCalled = true;
      });
    } else {
      showErrorSnackbar(context, "Coludn't Make call");
    }
  }
}

import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/rating/presentation/views/widgets/extanded_rating_bottom_sheet.dart';
import 'package:fixer/features/requests/data/models/order_carftsmen_model.dart';
import 'package:fixer/features/requests/presentation/views/widgets/request_details_container.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class EndingRequest extends StatefulWidget {
  final OrderCarftsmenModel model;
  const EndingRequest({super.key, required this.model});

  @override
  State<EndingRequest> createState() => _EndingRequestState();
}

class _EndingRequestState extends State<EndingRequest> {
  void _showBottomSheet(BuildContext context, OrderCarftsmenModel model) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: ColorManager.white,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: MediaQuery.of(context).size.height * 0.5,
              child: Center(
                  child: ExpandedContent(
                image: widget.model.profilePic,
              )),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: ColorManager.white,
            surfaceTintColor: ColorManager.white,
            elevation: 0,
            toolbarOpacity: 1.0),
        backgroundColor: ColorManager.white,
        body: Column(children: [
          Requestdetails(
            model: widget.model,
          ),
          SizedBox(
              height: size.height * 0.3,
              child: LottieBuilder.asset("assets/animations/ongoing.json")),
          verticalSpace(size.height * 0.01),
          Text(
            S.of(context).ongoing,
            style: TextStyles.headings,
          ),
          verticalSpace(size.height * 0.06),
          MaterialButton(
            onPressed: () => _showBottomSheet(context, widget.model),
            minWidth: 215.w,
            height: 47,
            color: ColorManager.primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text(
              S.of(context).endRequest,
              style: TextStyles.body.copyWith(color: ColorManager.white),
            ),
          )
        ]));
  }
}

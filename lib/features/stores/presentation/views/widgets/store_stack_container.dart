import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/stores/data/models/stores_model.dart';
import 'package:fixer/features/stores/presentation/views/widgets/store_info_container.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class StoreStackContainer extends StatelessWidget {
  final StoreModel store;
  const StoreStackContainer({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150.h,
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
              color: ColorManager.primary,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
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
                  child: Text(S.of(context).Stores,
                      style: TextStyles.normal
                          .copyWith(color: ColorManager.white))),
            ],
          ),
        ),
        Align(
            alignment: Alignment.center,
            child: StoreInfoContainer(
              store: store,
            ))
      ],
    );
  }
}

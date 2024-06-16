import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/profile/data/repos/profile_repo_impl.dart';
import 'package:fixer/features/profile/manager/cubit/profile_cubit.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeContainer extends StatelessWidget {
  const WelcomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).welcome,
                  style: TextStyles.subHeadingsBold
                      .copyWith(color: ColorManager.white),
                ),
                BlocProvider(
                  create: (context) =>
                      ProfileCubit(getIt<ProfileRepoImpl>())..getProfile(),
                  child: BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      if (ProfileCubit.get(context).user == null) {
                        return Text("user name",
                            style: TextStyles.normal
                                .copyWith(color: ColorManager.white));
                      } else {
                        return Text(ProfileCubit.get(context).user!.name!,
                            style: TextStyles.normal
                                .copyWith(color: ColorManager.white));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

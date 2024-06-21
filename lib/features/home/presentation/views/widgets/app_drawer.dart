import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/routing/app_router.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/craftsman_wallet/presentation/craftsmna_wallet_view.dart';
import 'package:fixer/features/profile/data/repos/profile_repo_impl.dart';
import 'package:fixer/features/profile/manager/cubit/profile_cubit.dart';
import 'package:fixer/features/user_sign_up/presentation/terms_and_conditions/terms_and_conditions.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:fixer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(getIt<ProfileRepoImpl>())..getProfile(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Drawer(
              child: Padding(
                padding: EdgeInsets.all(20.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DrawerHeader(
                        child: SvgPicture.asset("assets/images/fixr_logo.svg")),
                    verticalSpace(20),
                    ListTile(
                      title: Row(
                        children: [
                          Text(
                            S.of(context).complains,
                            style: TextStyles.lightHeadings,
                          ),
                          const Spacer(),
                          const Icon(Icons.error_outline)
                        ],
                      ),
                      onTap: () {
                        context.pushNamed(Routes.complains);
                      },
                    ),
                    verticalSpace(20),
                    ListTile(
                      title: Row(
                        children: [
                          Text(
                            S.of(context).policy,
                            style: TextStyles.lightHeadings,
                          ),
                          const Spacer(),
                          const Icon(Icons.business)
                        ],
                      ),
                      onTap: () {
                        navigateTo(context, const TermsAndConditionsPage());
                      },
                    ),
                    verticalSpace(20),
                    ListTile(
                      title: Row(
                        children: [
                          Text(
                            S.of(context).logout,
                            style: TextStyles.lightHeadings,
                          ),
                          const Spacer(),
                          const Icon(Icons.logout)
                        ],
                      ),
                      onTap: () async {
                        token = "";
                        kTokenBox.put(kTokenBoxString, token);
                        context.pushReplacementNamed(Routes.login);
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Drawer(
              child: Padding(
                padding: EdgeInsets.all(20.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DrawerHeader(
                        child: SvgPicture.asset("assets/images/fixr_logo.svg")),
                    verticalSpace(20),
                    ListTile(
                      title: Row(
                        children: [
                          Text(
                            S.of(context).complains,
                            style: TextStyles.lightHeadings,
                          ),
                          const Spacer(),
                          const Icon(Icons.error_outline)
                        ],
                      ),
                      onTap: () {
                        context.pushNamed(Routes.complains);
                      },
                    ),
                    if (ProfileCubit.get(context).user?.userType == "craftsman")
                      verticalSpace(20),
                    if (ProfileCubit.get(context).user?.userType == "craftsman")
                      ListTile(
                        title: Row(
                          children: [
                            Text(
                              S.of(context).wallet,
                              style: TextStyles.lightHeadings,
                            ),
                            const Spacer(),
                            const Icon(Icons.wallet)
                          ],
                        ),
                        onTap: () {
                          navigateTo(context, const CraftsmanWalletScreen());
                        },
                      ),
                    verticalSpace(20),
                    ListTile(
                      title: Row(
                        children: [
                          Text(
                            S.of(context).policy,
                            style: TextStyles.lightHeadings,
                          ),
                          const Spacer(),
                          const Icon(Icons.business)
                        ],
                      ),
                      onTap: () {
                        navigateTo(context, const TermsAndConditionsPage());
                      },
                    ),
                    verticalSpace(20),
                    ListTile(
                      title: Row(
                        children: [
                          Text(
                            S.of(context).logout,
                            style: TextStyles.lightHeadings,
                          ),
                          const Spacer(),
                          const Icon(Icons.logout)
                        ],
                      ),
                      onTap: () async {
                        token = "";
                        kTokenBox.put(kTokenBoxString, token);
                        context.pushReplacementNamed(Routes.login);
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

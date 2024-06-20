import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/craftsman_wallet/data/wallet_repo_impl.dart';
import 'package:fixer/features/craftsman_wallet/manager/cubit/wallet_cubit.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CraftsmanWalletScreen extends StatelessWidget {
  const CraftsmanWalletScreen({super.key}); // Example wallet amount

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => WalletCubit(getIt<WalletRepoImpl>())..getWallet(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).wallet,
            style: TextStyles.headings,
          ),
          centerTitle: true,
          toolbarHeight: 80.h,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.2,
                  width: size.width,
                  child: LottieBuilder.asset("assets/animations/wallet.json"),
                ),
                verticalSpace(size.height * 0.1),
                _buildWalletAmountCard(context, size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWalletAmountCard(context, Size size) {
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        if (state is WalletLoaded) {
          return SizedBox(
            height: size.height * 0.2,
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              color: ColorManager.primary,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(S.of(context).totalBalance,
                        style: TextStyles.whitesmallHeadings),
                    verticalSpace(30),
                    Text('\ج.م. ${state.amount}',
                        style: TextStyles.whitesmallHeadings),
                  ],
                ),
              ),
            ),
          );
        } else {
          return SizedBox(
            height: size.height * 0.2,
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              color: ColorManager.primary,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(S.of(context).totalBalance,
                        style: TextStyles.whitesmallHeadings),
                    verticalSpace(30),
                    const Center(
                        child: CircularProgressIndicator(
                      color: Colors.white,
                    )),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

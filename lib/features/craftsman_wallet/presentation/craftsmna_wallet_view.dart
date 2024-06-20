import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CraftsmanWalletScreen extends StatelessWidget {
  final double walletAmount = 1250.75;
  const CraftsmanWalletScreen({super.key}); // Example wallet amount

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
    );
  }

  Widget _buildWalletAmountCard(context, Size size) {
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
              Text('\ج.م. $walletAmount', style: TextStyles.whitesmallHeadings),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:fixer/core/routing/app_router.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/buttons/default_button.dart';
import 'package:fixer/features/home/presentation/views/home_view.dart';
import 'package:fixer/features/payment/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:fixer/features/payment/data/repos/checkout_repo_impl.dart';
import 'package:fixer/features/payment/manager/cubit/checkout_cubit.dart';
import 'package:fixer/features/requests/presentation/views/widgets/price_details_container.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentView extends StatelessWidget {
  final int orderId;
  const PaymentView({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          CheckoutCubit(CheckoutRepoImpl())..getPaymentDetails(orderId),
      child: BlocConsumer<CheckoutCubit, CheckoutState>(
          listener: (context, state) {
        if (state is CheckoutSuccess) {
          navigateAndFinish(context, const HomeView());
        } else if (state is CheckoutFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      }, builder: (context, state) {
        if (CheckoutCubit.get(context).resultt == null) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  S.of(context).payment,
                  style: TextStyles.subHeadings,
                ),
                centerTitle: true,
                toolbarHeight: 80,
              ),
              body: const Center(child: CircularProgressIndicator()));
        } else {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  S.of(context).payment,
                  style: TextStyles.subHeadingsBold,
                ),
                backgroundColor: ColorManager.white,
                centerTitle: true,
                toolbarHeight:80,
              ),
              body: Padding(
                padding: const EdgeInsets.only(left: 24,right: 24,bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Pricedetails(model: CheckoutCubit.get(context).resultt!),
                    SizedBox(
                      width: size.width * 0.8,
                      child: DefaultButton(
                          text: S.of(context).pay,
                          onPressed: () {
                            CheckoutCubit.get(context).checkout(
                                model: PaymentIntentInputModel(
                                    amount: CheckoutCubit.get(context)
                                        .resultt!
                                        .orderSummary!
                                        .total
                                        .toString(),
                                    currency: "EGP"));
                          }),
                    )
                  ],
                ),
              ));
        }
      }),
    );
  }
}

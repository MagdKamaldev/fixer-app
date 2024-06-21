import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/buttons/default_button.dart';
import 'package:fixer/features/payment/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:fixer/features/payment/data/models/payment_models/order_sumary_model/order_sumary_model.dart';
import 'package:fixer/features/payment/data/repos/checkout_repo_impl.dart';
import 'package:fixer/features/payment/manager/cubit/checkout_cubit.dart';
import 'package:fixer/features/requests/presentation/views/widgets/price_details_container.dart';
import 'package:fixer/features/services/data/models/service_model.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(CheckoutRepoImpl()),
      child: BlocConsumer<CheckoutCubit, CheckoutState>(
        listener: (context, state) {
          if (state is CheckoutSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Payment Success')));
          } else if (state is CheckoutFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) => Scaffold(
            appBar: AppBar(
              title: Text(
                S.of(context).payment,
                style: TextStyles.headings,
              ),
              centerTitle: true,
              toolbarHeight: 80,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Pricedetails(
                      model: OrderSumaryModel(
                          clientId: "id",
                          clientName: "magd",
                          craftsmanId: "234",
                          craftsmanName: "mohsen",
                          done: true,
                          orderId: 23,
                          services: [
                            ServiceModel(
                              id: 1,
                              name: "service 1",
                              price: 100,
                            ),
                            ServiceModel(
                              id: 1,
                              name: "service 1",
                              price: 100,
                            ),
                            ServiceModel(
                              id: 1,
                              name: "service 1",
                              price: 100,
                            ),
                            ServiceModel(
                              id: 1,
                              name: "service 1",
                              price: 100,
                            ),
                          ],
                          total: 500)),
                  DefaultButton(
                      text: S.of(context).pay,
                      onPressed: () {
                        CheckoutCubit.get(context).checkout(
                            model: PaymentIntentInputModel(
                                amount: "500", currency: "EGP"));
                      })
                ],
              ),
            )),
      ),
    );
  }
}

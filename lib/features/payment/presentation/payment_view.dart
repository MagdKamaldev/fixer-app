import 'package:fixer/core/widgets/buttons/default_button.dart';
import 'package:fixer/features/payment/data/models/payment_intent_input_model.dart';
import 'package:fixer/features/payment/data/repos/checkout_repo_impl.dart';
import 'package:fixer/features/payment/manager/cubit/checkout_cubit.dart';
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
            appBar: AppBar(),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Payment View'),
                DefaultButton(
                    text: "Pay",
                    onPressed: () {
                      CheckoutCubit.get(context).checkout(
                          model: PaymentIntentInputModel(
                              amount: "500", currency: "EGP"));
                    })
              ],
            )),
      ),
    );
  }
}

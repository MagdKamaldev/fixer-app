// ignore_for_file: use_build_context_synchronously
import 'package:dio/dio.dart';
import 'package:fixer/core/keys/api_keys.dart';
import 'package:fixer/core/networks/api_services/api_services.dart';
import 'package:fixer/features/payment/data/models/payment_intent_input_model.dart';
import 'package:fixer/features/payment/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeServices {
  final ApiServices _apiServices = ApiServices(Dio());

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    final response = await _apiServices.stripePost(
      body: paymentIntentInputModel.toJson(),
      token: ApiKeys.secrtKey,
      contentType: Headers.formUrlEncodedContentType,
      url: "https://api.stripe.com/v1/payment_intents",
    );

    PaymentIntentModel model = PaymentIntentModel.fromJson(response.data);

    return model;
  }

  Future initPaymentSheet({
    required String paymentIntentClientSecret,
  }) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentIntentClientSecret,
      merchantDisplayName: "Fixer",
    ));
  }

  Future<void> presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    PaymentIntentModel paymentIntentModel =
        await createPaymentIntent(paymentIntentInputModel);

    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);

    await presentPaymentSheet();
  }
}

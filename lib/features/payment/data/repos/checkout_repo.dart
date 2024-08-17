import 'package:dartz/dartz.dart';
import 'package:fixer/core/networks/errors/errors.dart';
import 'package:fixer/features/payment/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:fixer/features/payment/data/models/payment_model/payment_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, PaymentModel>> getPaymentDetails(int orderId);
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel model,
  });
}

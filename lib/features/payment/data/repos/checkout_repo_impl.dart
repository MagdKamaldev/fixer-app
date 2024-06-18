import 'package:dartz/dartz.dart';
import 'package:fixer/core/networks/errors/errors.dart';
import 'package:fixer/features/payment/data/models/payment_intent_input_model.dart';
import 'package:fixer/features/payment/data/repos/checkout_repo.dart';
import 'package:fixer/features/payment/services/stripe_services.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeServices services = StripeServices();

  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel model}) async {
    try {
      await services.makePayment(paymentIntentInputModel: model);
      return Future.value(const Right(null));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(e.toString())));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fixer/core/networks/api_services/api_services.dart';
import 'package:fixer/core/networks/errors/errors.dart';
import 'package:fixer/features/payment/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:fixer/features/payment/data/models/payment_model/payment_model.dart';
import 'package:fixer/features/payment/data/repos/checkout_repo.dart';
import 'package:fixer/features/payment/services/stripe_services.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final ApiServices service = ApiServices(Dio());
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

  @override
  Future<Either<Failure, PaymentModel>> getPaymentDetails(int orderId) async {
    try {
      final response = await service.get(endPoint: "Payment/$orderId");
      final payment = PaymentModel.fromJson(response);
      return Right(payment);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

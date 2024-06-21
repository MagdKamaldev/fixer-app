part of 'checkout_cubit.dart';

sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutSuccess extends CheckoutState {}

final class CheckoutFailed extends CheckoutState {
  final String message;
  CheckoutFailed({required this.message});
}

final class GetPaymentDetailsLoading extends CheckoutState {}

final class GetPaymentDetailsSuccess extends CheckoutState {
  final PaymentModel payment;
  GetPaymentDetailsSuccess({required this.payment});
}

final class GetPaymentDetailsFailed extends CheckoutState {
  final String message;
  GetPaymentDetailsFailed({required this.message});
}

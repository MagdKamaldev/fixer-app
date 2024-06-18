class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String paymentMethodId;
  final String returnUrl;

  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
    required this.paymentMethodId,
    required this.returnUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'currency': currency,
      'paymentMethodId': paymentMethodId,
      'returnUrl': returnUrl,
    };
  }
}
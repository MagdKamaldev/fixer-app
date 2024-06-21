import 'order_summary.dart';
import 'payment.dart';

class PaymentModel {
  OrderSummary? orderSummary;
  Payment? payment;

  PaymentModel({this.orderSummary, this.payment});

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        orderSummary: json['Order summary '] == null
            ? null
            : OrderSummary.fromJson(
                json['Order summary '] as Map<String, dynamic>),
        payment: json['payment'] == null
            ? null
            : Payment.fromJson(json['payment'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'Order summary ': orderSummary?.toJson(),
        'payment': payment?.toJson(),
      };
}

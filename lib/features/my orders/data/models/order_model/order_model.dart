

import 'package:fixer/features/services/data/models/service_model.dart';

class OrderModel {
  int? clientId;
  int? craftsmanId;
  DateTime? date;
  int? orderId;
  List<ServiceModel>? services;
  int? total;

  OrderModel({
    this.clientId,
    this.craftsmanId,
    this.date,
    this.orderId,
    this.services,
    this.total,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        clientId: json['client_id'] as int?,
        craftsmanId: json['craftsman_id'] as int?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        orderId: json['order_id'] as int?,
        services: (json['services'] as List<dynamic>?)
            ?.map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'client_id': clientId,
        'craftsman_id': craftsmanId,
        'date': date?.toIso8601String(),
        'order_id': orderId,
        'services': services?.map((e) => e.toJson()).toList(),
        'total': total,
      };
}

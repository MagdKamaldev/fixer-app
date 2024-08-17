import 'service.dart';

class OrderSummary {
  String? clientId;
  String? clientName;
  String? craftsmanId;
  String? craftsmanName;
  bool? done;
  int? orderId;
  List<Service>? services;
  int? total;

  OrderSummary({
    this.clientId,
    this.clientName,
    this.craftsmanId,
    this.craftsmanName,
    this.done,
    this.orderId,
    this.services,
    this.total,
  });

  factory OrderSummary.fromJson(Map<String, dynamic> json) => OrderSummary(
        clientId: json['client_id'] as String?,
        clientName: json['client_name'] as String?,
        craftsmanId: json['craftsman_id'] as String?,
        craftsmanName: json['craftsman_name'] as String?,
        done: json['done'] as bool?,
        orderId: json['order_id'] as int?,
        services: (json['services'] as List<dynamic>?)
            ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'client_id': clientId,
        'client_name': clientName,
        'craftsman_id': craftsmanId,
        'craftsman_name': craftsmanName,
        'done': done,
        'order_id': orderId,
        'services': services?.map((e) => e.toJson()).toList(),
        'total': total,
      };
}

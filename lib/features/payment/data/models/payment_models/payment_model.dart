class PaymentModel {
  int? clientId;
  int? id;
  int? orderId;
  int? total;

  PaymentModel({this.clientId, this.id, this.orderId, this.total});

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        clientId: json['client_id'] as int?,
        id: json['id'] as int?,
        orderId: json['order_id'] as int?,
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'client_id': clientId,
        'id': id,
        'order_id': orderId,
        'total': total,
      };
}

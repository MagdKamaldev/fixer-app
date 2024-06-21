class Payment {
  int? clientId;
  int? id;
  int? orderId;
  int? total;

  Payment({this.clientId, this.id, this.orderId, this.total});

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
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

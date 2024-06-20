class OrderModel {
  int? clientId;
  int? craftsmanId;
  bool? done;
  int? orderId;
  int? total;

  OrderModel({
    this.clientId,
    this.craftsmanId,
    this.done,
    this.orderId,
    this.total,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        clientId: json['client_id'] as int?,
        craftsmanId: json['craftsman_id'] as int?,
        done: json['done'] as bool?,
        orderId: json['order_id'] as int?,
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'client_id': clientId,
        'craftsman_id': craftsmanId,
        'done': done,
        'order_id': orderId,
        'total': total,
      };
}

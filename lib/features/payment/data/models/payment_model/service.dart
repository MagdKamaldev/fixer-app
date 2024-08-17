class Service {
  int? id;
  String? name;
  int? price;

  Service({this.id, this.name, this.price});

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json['id'] as int?,
        name: json['name'] as String?,
        price: json['price'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
      };
}

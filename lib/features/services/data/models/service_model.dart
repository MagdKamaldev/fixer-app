class ServiceModel {
  int? id;
  String? name;
  int? price;

  ServiceModel({this.id, this.name, this.price});

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
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

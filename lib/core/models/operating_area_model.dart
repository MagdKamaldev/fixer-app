class OperatingAreaModel {
  int? id;
  String? name;

  OperatingAreaModel({this.id, this.name});

  factory OperatingAreaModel.fromJson(Map<String, dynamic> json) {
    return OperatingAreaModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

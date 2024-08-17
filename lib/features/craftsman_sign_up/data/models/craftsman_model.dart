class CraftsmanModel {
  String? email;
  String? categoryName;
  int? id;
  String? name;
  String? phone;
  String? userType;
  String? username;
  String? password;

  CraftsmanModel({
    this.email,
    this.categoryName,
    this.id,
    this.name,
    this.phone,
    this.userType,
    this.username,
    this.password,
  });

  factory CraftsmanModel.fromJson(Map<String, dynamic> json) {
    return CraftsmanModel(
      email: json['Email'] as String?,
      categoryName: json['category_name'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      userType: json['user_type'] as String?,
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'Email': email,
        'category_name': categoryName,
        'name': name,
        "password": password,
        'phone': phone,
        'user_type': userType,
        'username': username,
      };
}

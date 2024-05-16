class CraftsmanModel {
  String? email;
  String? categoryName;
  int? id;
  String? image;
  String? name;
  String? phone;
  String? userType;
  String? username;
  String? password;

  CraftsmanModel({
    this.email,
    this.categoryName,
    this.id,
    this.image,
    this.name,
    this.phone,
    this.userType,
    this.username,
    this.password
  });

  factory CraftsmanModel.fromJson(Map<String, dynamic> json) {
    return CraftsmanModel(
      email: json['Email'] as String?,
      categoryName: json['category_name'] as String?,
      id: json['id'] as int?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      userType: json['user_type'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?
    );
  }

  Map<String, dynamic> toJson() => {
        'Email': email,
        'category_name': categoryName,
        'id': id,
        'image': image,
        'name': name,
        'phone': phone,
        'user_type': userType,
        'username': username,
        'password': password
      };
}

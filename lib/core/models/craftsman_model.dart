class CraftsmanModel {
  String? name;
  String? username;
  String? email;
  String? password;
  String? phone;
  String? image;
  String? userType;
  String? categoryName;

  CraftsmanModel({
    this.name,
    this.username,
    this.email,
    this.password,
    this.phone,
    this.image,
    this.userType,
    this.categoryName,
  });

  factory CraftsmanModel.fromJson(Map<String, dynamic> json) {
    return CraftsmanModel(
      name: json['name'] as String?,
      username: json['username'] as String?,
      email: json['Email'] as String?,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] as String?,
      userType: json['user_type'] as String?,
      categoryName: json['category_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'username': username,
        'Email': email,
        'password': password,
        'phone': phone,
        'image': image,
        'user_type': userType,
        'category_name': categoryName,
      };
}

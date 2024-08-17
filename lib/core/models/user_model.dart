class UserModel {
  String? email;
  int? id;
  String? name;
  String? phone;
  String? userType;
  String? username;

  UserModel({
    this.email,
    this.id,
    this.name,
    this.phone,
    this.userType,
    this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'] as String?,
        id: json['id'] as int?,
        name: json['name'] as String?,
        phone: json['phone'] as String?,
        userType: json['user_type'] as String?,
        username: json['username'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'id': id,
        'name': name,
        'phone': phone,
        'user_type': userType,
        'username': username,
      };
}

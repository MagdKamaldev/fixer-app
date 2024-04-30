import 'address.dart';
import 'location.dart';

class UserModel {
  String? name;
  String? username;
  String? email;
  String? phone;
  String? userType;
  Location? location;
  Address? address;

  UserModel({
    this.name,
    this.username,
    this.email,
    this.phone,
    this.userType,
    this.location,
    this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        userType: json['user_type'] as String?,
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
        address: json['address'] == null
            ? null
            : Address.fromJson(json['address'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'username': username,
        'email': email,
        'phone': phone,
        'user_type': userType,
        'location': location?.toJson(),
        'address': address?.toJson(),
      };
}

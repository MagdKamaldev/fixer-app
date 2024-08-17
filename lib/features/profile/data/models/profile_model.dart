class ProfileModel {
  String? email;
  int? id;
  String? name;
  String? phone;
  String? profilePic;
  String? userType;
  String? username;

  ProfileModel({
    this.email,
    this.id,
    this.name,
    this.phone,
    this.profilePic,
    this.userType,
    this.username,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        email: json['Email'] as String?,
        id: json['id'] as int?,
        name: json['name'] as String?,
        phone: json['phone'] as String?,
        profilePic: json['profile_pic'] as String?,
        userType: json['user_type'] as String?,
        username: json['username'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Email': email,
        'id': id,
        'name': name,
        'phone': phone,
        'profile_pic': profilePic,
        'user_type': userType,
        'username': username,
      };
}

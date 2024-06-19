class OrderCarftsmenModel {
  int? completedOrders;
  double? fair;
  int? id;
  String? name;
  String? phone;
  dynamic profilePic;
  int? rating;
  String? username;

  OrderCarftsmenModel({
    this.completedOrders,
    this.fair,
    this.id,
    this.name,
    this.phone,
    this.profilePic,
    this.rating,
    this.username,
  });

  factory OrderCarftsmenModel.fromJson(Map<String, dynamic> json) {
    return OrderCarftsmenModel(
      completedOrders: json['completed_orders'] as int?,
      fair: (json['fair'] as num?)?.toDouble(),
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      profilePic: json['profile_pic'] as dynamic,
      rating: json['rating'] as int?,
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'completed_orders': completedOrders,
        'fair': fair,
        'id': id,
        'name': name,
        'phone': phone,
        'profile_pic': profilePic,
        'rating': rating,
        'username': username,
      };
}

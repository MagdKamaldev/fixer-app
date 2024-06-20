class ReviewModel {
  int? clientId;
  String? feedback;
  String? name;
  int? rating;

  ReviewModel({this.clientId, this.feedback, this.name, this.rating});

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        clientId: json['client_id'] as int?,
        feedback: json['feedback'] as String?,
        name: json['name'] as String?,
        rating: json['rating'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'client_id': clientId,
        'feedback': feedback,
        'name': name,
        'rating': rating,
      };
}

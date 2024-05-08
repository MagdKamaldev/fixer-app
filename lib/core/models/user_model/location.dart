class LocationModel {
  double? latitude;
  double? longitude;

  LocationModel({this.latitude, this.longitude});

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}

class LocationModel {
  String? lat;
  String? long;
  String? additional;
  String? apartment;
  String? building;
  String? city;
  String? district;
  String? floor;
  int? id;
  String? street;

  LocationModel({
    this.lat,
    this.long,
    this.additional,
    this.apartment,
    this.building,
    this.city,
    this.district,
    this.floor,
   
    this.id,
    this.street,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        lat: json['Lat'] as String?,
        long: json['Long'] as String?,
        additional: json['additional'] as String?,
        apartment: json['apartment'] as String?,
        building: json['building'] as String?,
        city: json['city'] as String?,
        district: json['district'] as String?,
        floor: json['floor'] as String?,
        id: json['id'] as int?,
        street: json['street'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Lat': lat,
        'Long': long,
        'additional': additional,
        'apartment': apartment,
        'building': building,
        'city': city,
        'district': district,
        'floor': floor,
        'id': id,
        'street': street,
      };
}

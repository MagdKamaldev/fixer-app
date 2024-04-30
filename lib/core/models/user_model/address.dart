class Address {
  String? buildingName;
  String? apartmentNumber;
  int? floor;
  String? street;
  String? additionalDirections;

  Address({
    this.buildingName,
    this.apartmentNumber,
    this.floor,
    this.street,
    this.additionalDirections,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        buildingName: json['building_name'] as String?,
        apartmentNumber: json['apartment_number'] as String?,
        floor: json['floor'] as int?,
        street: json['street'] as String?,
        additionalDirections: json['additional_directions'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'building_name': buildingName,
        'apartment_number': apartmentNumber,
        'floor': floor,
        'street': street,
        'additional_directions': additionalDirections,
      };
}

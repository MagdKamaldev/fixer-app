class MessegeModel {
  String? contactEmail;
  String? messageDetail;

  MessegeModel({this.contactEmail, this.messageDetail});

  factory MessegeModel.fromJson(Map<String, dynamic> json) => MessegeModel(
        contactEmail: json['ContactEmail'] as String?,
        messageDetail: json['MessageDetail'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'ContactEmail': contactEmail,
        'MessageDetail': messageDetail,
      };
}

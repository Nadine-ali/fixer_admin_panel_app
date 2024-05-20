class MessageModel {
  String? contactEmail;
  String? messageDetail;
  int? id;
  int? userId;
  String? userType;

  MessageModel({
    this.contactEmail,
    this.messageDetail,
    this.id,
    this.userId,
    this.userType,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        contactEmail: json['ContactEmail'] as String?,
        messageDetail: json['MessageDetail'] as String?,
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        userType: json['user_type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'ContactEmail': contactEmail,
        'MessageDetail': messageDetail,
        'id': id,
        'user_id': userId,
        'user_type': userType,
      };
}

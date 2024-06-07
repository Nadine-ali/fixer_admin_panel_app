class CopounModel {
  String? code;
  String? dateCreated;
  String? expDate;
  int? storeId;
  int? value;

  CopounModel({
    this.code,
    this.dateCreated,
    this.expDate,
    this.storeId,
    this.value,
  });

  factory CopounModel.fromJson(Map<String, dynamic> json) => CopounModel(
        code: json['code'] as String?,
        dateCreated: json['date_created'] as String?,
        expDate: json['exp_date'] as String?,
        storeId: json['store_id'] as int?,
        value: json['value'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'date_created': dateCreated,
        'exp_date': expDate,
        'store_id': storeId,
        'value': value,
      };
}

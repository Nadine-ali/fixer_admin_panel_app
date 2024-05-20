class ChartsModel {
  int? clients;
  int? stores;
  int? approvedCraftsmen;
  int? pendingCraftsmen;
  int? totalCraftsmen;

  ChartsModel({
    this.clients,
    this.stores,
    this.approvedCraftsmen,
    this.pendingCraftsmen,
    this.totalCraftsmen,
  });

  factory ChartsModel.fromJson(Map<String, dynamic> json) => ChartsModel(
        clients: json['Clients'] as int?,
        stores: json['Stores'] as int?,
        approvedCraftsmen: json['approved craftsmen'] as int?,
        pendingCraftsmen: json['pending craftsmen'] as int?,
        totalCraftsmen: json['total craftsmen'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'Clients': clients,
        'Stores': stores,
        'approved craftsmen': approvedCraftsmen,
        'pending craftsmen': pendingCraftsmen,
        'total craftsmen': totalCraftsmen,
      };
}

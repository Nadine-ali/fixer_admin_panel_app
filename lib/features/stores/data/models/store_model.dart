class StoreModel {
  String? description;
  int? id;
  int? itemsCount;
  String? location;
  String? name;

  StoreModel({
    this.description,
    this.id,
    this.itemsCount,
    this.location,
    this.name,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        description: json['description'] as String?,
        id: json['id'] as int?,
        itemsCount: json['items_count'] as int?,
        location: json['location'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'description': description,
        'id': id,
        'items_count': itemsCount,
        'location': location,
        'name': name,
      };
}

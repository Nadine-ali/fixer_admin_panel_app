import 'category.dart';

class ServiceModel {
  Category? category;
  int? id;
  String? name;
  int? price;

  ServiceModel({this.category, this.id, this.name, this.price});

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        category: json['category'] == null
            ? null
            : Category.fromJson(json['category'] as Map<String, dynamic>),
        id: json['id'] as int?,
        name: json['name'] as String?,
        price: json['price'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'category': category?.toJson(),
        'id': id,
        'name': name,
        'price': price,
      };
}

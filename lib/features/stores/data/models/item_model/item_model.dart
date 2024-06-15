import 'stores.dart';

class ItemModel {
  int? id;
  String? image;
  String? name;
  String? price;
  int? quantity;
  Stores? stores;

  ItemModel({
    this.id,
    this.image,
    this.name,
    this.price,
    this.quantity,
    this.stores,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json['id'] as int?,
        image: json['image'] as String?,
        name: json['name'] as String?,
        price: json['price'] as String?,
        quantity: json['quantity'] as int?,
        stores: json['stores'] == null
            ? null
            : Stores.fromJson(json['stores'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'name': name,
        'price': price,
        'quantity': quantity,
        'stores': stores?.toJson(),
      };
}

class ItemModel {
  int? id;
  String? name;
  String? price;
  int? quantity;

  ItemModel({this.id, this.name, this.price, this.quantity});

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        price: json['price'] as String?,
        quantity: json['quantity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'quantity': quantity,
      };
}

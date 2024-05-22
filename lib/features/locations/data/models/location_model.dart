class LocationModel {
  int? id;
  String? name;
  String? price;
  int? quantity;

  LocationModel({this.id, this.name, this.price, this.quantity});

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
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

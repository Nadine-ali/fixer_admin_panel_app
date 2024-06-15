class Stores {
  dynamic description;
  int? id;
  String? location;
  String? name;

  Stores({this.description, this.id, this.location, this.name});

  factory Stores.fromJson(Map<String, dynamic> json) => Stores(
        description: json['description'] as dynamic,
        id: json['id'] as int?,
        location: json['location'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'description': description,
        'id': id,
        'location': location,
        'name': name,
      };
}

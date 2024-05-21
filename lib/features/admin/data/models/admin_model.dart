class AdminModel {
  String? email;
  String? role;
  int? id;
  String? name;
  String? username;

  AdminModel({this.email, this.role, this.id, this.name, this.username});

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
        email: json['Email'] as String?,
        role: json['Role'] as String?,
        id: json['id'] as int?,
        name: json['name'] as String?,
        username: json['username'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Email': email,
        'Role': role,
        'id': id,
        'name': name,
        'username': username,
      };
}

class CraftsmanModel {
  String? email;
  String? backImage;
  String? frontImage;
  int? id;
  String? name;
  String? phone;
  String? profilePic;
  String? userType;
  String? username;

  CraftsmanModel({
    this.email,
    this.backImage,
    this.frontImage,
    this.id,
    this.name,
    this.phone,
    this.profilePic,
    this.userType,
    this.username,
  });

  factory CraftsmanModel.fromJson(Map<String, dynamic> json) {
    return CraftsmanModel(
      email: json['Email'] as String?,
      backImage: json['back_image'] as String?,
      frontImage: json['front_image'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      profilePic: json['profile_pic'] as String?,
      userType: json['user_type'] as String?,
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'Email': email,
        'back_image': backImage,
        'front_image': frontImage,
        'id': id,
        'name': name,
        'phone': phone,
        'profile_pic': profilePic,
        'user_type': userType,
        'username': username,
      };
}

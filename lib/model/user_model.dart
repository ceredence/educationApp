class UserModel {
  final int id;
  final String name;
  final String email;
  final String? role;
  final String? avatar;
  final String? googleId;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.role,
    this.avatar,
    this.googleId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      avatar: json['avatar'],
      googleId: json['google_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'avatar': avatar,
      'google_id': googleId,
    };
  }
}

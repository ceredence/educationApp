import 'package:dinacomapp/model/user_model.dart';

class RegisterResponse {
  final bool success;
  final String message;
  final UserModel user;
  final String token;

  RegisterResponse({
    required this.success,
    required this.message,
    required this.user,
    required this.token,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      success: json['success'],
      message: json['message'],
      user: UserModel.fromJson(json['data']),
      token: json['token'],
    );
  }
}

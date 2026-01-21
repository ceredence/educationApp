import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, String>> authHeader() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("token");

  return {
    "Accept": "application/json",
    "Content-Type": "application/json",
    "Authorization": "Bearer $token",
  };
}

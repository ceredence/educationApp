import 'dart:convert';

import 'package:http/http.dart' as http;

class GeminiService {
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  Future<String> generateContent(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/ai/generate'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({'prompt': prompt}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['data']['response'];
      } 
      else {  
        final error = json.decode(response.body);
        throw Exception(error['message'] ?? 'Failed to generate');
      }

    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

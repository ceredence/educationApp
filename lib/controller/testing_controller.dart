import 'package:dinacomapp/geminiService.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TestingController extends GetxController {
  final TextEditingController promptController = TextEditingController();

  final GeminiService geminiService = GeminiService();

  var responseText = "".obs;
  var loading = false.obs;

  Future<void> sendPrompt() async {
    if (promptController.text.isEmpty) return;

    loading.value = true;

    responseText.value = ""; // clear dulu

    try {
      // ===== PANGGIL API DI SINI =====
      final result =
          await geminiService.generateContent(promptController.text);

      responseText.value = result;
    } catch (e) {
      responseText.value = "Error: $e";
      print("Error: $e");
    } finally {
      loading.value = false;
    }
  }
}
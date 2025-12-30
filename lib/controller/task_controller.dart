import 'dart:convert';

import 'package:dinacomapp/model/question_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TaskController extends GetxController {
  final RxString question = "pertanyaan".obs;
  final RxString taskType = 'baca'.obs;
  final RxString imageUrl = ''.obs;
  final RxList<String> options = <String>[].obs;
  final RxString selectedAnswer = ''.obs;
  final RxInt questionId = 1.obs;
  final RxString submissionImage = ''.obs;
  final RxString? correctAnswer = ''.obs;

  var isLoading = false.obs;

  void selectAnswer(String value) {
    selectedAnswer.value = value;
  }

  Future<void> fetchQuestions({
    required String activityCode,
    required String level,
  }) async {
    const url = 'http://10.0.2.2:8000/api/questions';

    try {
      isLoading.value = true;
      final uri = Uri.parse(
        url,
      ).replace(queryParameters: {'type': activityCode, 'level': level});
      final response = await http.get(uri);
      debugPrint("status code " + response.statusCode.toString());
      debugPrint("json response " + response.body.toString());

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        final questions = data.map((e) => Questions.fromJson(e)).toList();

        if (questions.isEmpty) {
          throw Exception('Soal kosong untuk kategori & level ini');
        }
        final q = (questions..shuffle()).first;

        question.value = q.question;
        taskType.value = q.type;
        imageUrl.value = q.imageUrl ?? '';
        questionId.value = q.id;
        correctAnswer?.value = q.answer ?? '';
        options.assignAll(q.options ?? []);

        if (q.type == 'hitung' && q.options == null && q.type == 'baca') {
          throw Exception('Soal hitung tapi options kosong');
        }
      } else {
        Get.snackbar("Error", "Gagal fetch soal");
        debugPrint("status code " + response.statusCode.toString());
        debugPrint("json response " + response.body.toString());
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
      debugPrint("error" + e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> submitAnswer() async {
    final isCorrect = selectedAnswer.value == correctAnswer?.value.trim();
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/submissions'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'question_id': questionId.value,
        'answer': selectedAnswer.value,
        'predicted_answer': selectedAnswer.value,
        'submission_image_path': submissionImage.value,
        'confidence_score': isCorrect ? 1.0 : 0.3,
      }),
    );

    if (response.statusCode == 200) {
      print('Jawaban berhasil dikirim');
    } else {
      final decoded = jsonDecode(response.body);

      print('Gagal kirim jawaban');
      debugPrint('ERROR MESSAGE: ${decoded['message']}');
      debugPrint('STATUS CODE: ${response.statusCode}');
    }
  }
}

import 'dart:convert';

import 'package:dinacomapp/model/question_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TaskController extends GetxController {
  // question
  final RxString question = "pertanyaan".obs;
  final RxString taskType = 'baca'.obs;
  final RxString imageUrl = ''.obs;
  final RxInt questionId = 1.obs;

  // submission
  final RxList<String> options = <String>[].obs;
  final RxString selectedAnswer = ''.obs;
  final RxString submissionImage = ''.obs;
  final RxString? correctAnswer = ''.obs;

  // batch buat ngelompokin per sesi
  final RxInt batchId = 0.obs;
  final RxInt currentIndex = 0.obs;
  final RxInt totalQuestions = 5.obs;
  final RxString level = ''.obs;

  // loading
  var isLoading = false.obs;

  // pilih jawaban
  void selectAnswer(String value) {
    selectedAnswer.value = value;
  }

  // fetching questions
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

        if (q.type == 'hitung' && q.options == null) {
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

  // submit answer
  Future<void> submitAnswer() async {
    final isCorrect = selectedAnswer.value == correctAnswer?.value.trim();
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/submissions'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'submission_batch_id': batchId.value,
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

  void nextQuestion() {
    selectedAnswer.value = '';
    currentIndex.value++;

    if (currentIndex.value < totalQuestions.value) {
      fetchQuestions(activityCode: taskType.value, level: 'low');
    } else {
      finishBatch();
    }
  }

  Future<void> startBatch({
    required int activityId,
    required String level,
  }) async {
    try {
      debugPrint('🚀 Starting batch...');
      debugPrint('Activity ID: $activityId');
      debugPrint('Level: $level');
      debugPrint('Total Questions: ${totalQuestions.value}');

      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/batches/start'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'activity_id': activityId,
          'level': level,
          'total_questions': totalQuestions.value,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        batchId.value = data['batch_id'];
        currentIndex.value = 0;

        debugPrint('BATCH STARTED: ${batchId.value}');
      } else {
        debugPrint('❌ Gagal start batch');
        debugPrint('STATUS CODE: ${response.statusCode}');
        debugPrint('ERROR: ${response.body}');
      }
    } catch (e) {
      debugPrint('❌ Exception: $e');
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    }
  }

  Future<void> finishBatch() async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/batches/${batchId.value}/finish'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      Get.offNamed(
        '/behavior',
        arguments: {
          'correct': data['result']['correct_count'],
          'total': data['result']['total_questions'],
        },
      );
    } else {
      debugPrint('❌ gagal finish batch');
    }
  }
}
import 'dart:convert';
import 'package:dinacomapp/model/question_model.dart';
import 'package:dinacomapp/routes/routes.dart';
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
  final RxList<int> questionIds = <int>[].obs;

  // loading
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  // pilih jawaban
  void selectAnswer(String value) {
    selectedAnswer.value = value;
  }

  // fetching questions
  Future<void> fetchQuestionByIndex() async {
    if (questionIds.isEmpty) {
      debugPrint('❌ questionIds kosong');
      return;
    }

    if (currentIndex.value >= questionIds.length) {
      debugPrint('❌ currentIndex out of range');
      return;
    }
    final id = questionIds[currentIndex.value];

    try {
      final url = 'http://10.0.2.2:8000/api/questions/$id';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        final q = Questions.fromJson(json);

        question.value = q.question;
        taskType.value = q.type;
        imageUrl.value = q.imageUrl ?? '';
        questionId.value = q.id;
        correctAnswer?.value = q.answer ?? '';
        options.assignAll(q.options ?? []);

        debugPrint('✅ Question loaded successfully');
      } else {
        debugPrint('❌ HTTP error: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      debugPrint('❌ Exception in fetchQuestionByIndex: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  // submit answer
  Future<bool> submitAnswer() async {
    final isCorrect = selectedAnswer.value == correctAnswer?.value.trim();

    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/submissions'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'submission_batch_id': batchId.value,
        'question_id': questionId.value,
        'predicted_answer': selectedAnswer.value,
        'submission_image_path': submissionImage.value,
        'confidence_score': isCorrect ? 1.0 : 0.3,
      }),
    );

    if (response.statusCode == 200) {
      debugPrint('✅ Jawaban berhasil dikirim');
      return true;
    } else {
      debugPrint('❌ Gagal kirim jawaban');
      debugPrint('STATUS: ${response.statusCode}');
      debugPrint('BODY: ${response.body}');
      return false;
    }
  }

  Future<void> startBatch({
    required int activityId,
    required String level,
  }) async {
    try {
      batchId.value = 0;
      currentIndex.value = 0;
      questionIds.clear();
      selectedAnswer.value = '';
      submissionImage.value = '';
      question.value = '';
      options.clear();

      debugPrint('🚀 Starting batch...');
      debugPrint('Activity ID: $activityId');
      debugPrint('Level: $level');

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
        currentIndex.value = 0;
        batchId.value = data['batch_id'];
        questionIds.assignAll(List<int>.from(data['question_ids']));

        debugPrint('BATCH STARTED: ${batchId.value}');
        debugPrint('QUESTION IDS: $questionIds');

        await fetchQuestionByIndex();
      } else {
        debugPrint('❌ Gagal start batch');
        debugPrint('STATUS CODE: ${response.statusCode}');
        debugPrint('ERROR: ${response.body}');

        throw Exception('Gagal start batch: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('❌ Exception: $e');
      Get.snackbar("Error", "Terjadi kesalahan: $e");

      rethrow;
    }
  }

  Future<void> finishBatch() async {
    final response = await http.post(
      Uri.parse(
        'http://10.0.2.2:8000/api/batches/${batchId.value}/finish',
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      Get.offNamed(
        AppRoutes.summaryPage,
        arguments: {
          'correct': data['correct'],
          'wrong': data['wrong'],
          'message': data['message'],
        },
      );
    } else {
      debugPrint('❌ gagal finish batch');
      debugPrint('STATUS CODE: ${response.statusCode}');
      debugPrint('ERROR: ${response.body}');
    }
  }

  Future<void> submitAndNext() async {
    if (selectedAnswer.value.isEmpty) {
      Get.snackbar('Warning', 'Pilih jawaban');
      return;
    }

    final success = await submitAnswer();

    if (!success) {
      Get.snackbar('Error', 'Jawaban gagal disimpan');
      return;
    }

    // reset state
    selectedAnswer.value = '';
    currentIndex.value++;

    if (currentIndex.value < questionIds.length) {
      await fetchQuestionByIndex();
    } else {
      await finishBatch();
    }
  }
}

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
      final uri = Uri.parse(url).replace(queryParameters: {
        'type': activityCode,
        'level':level,
      });
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
      debugPrint("error"+ e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}


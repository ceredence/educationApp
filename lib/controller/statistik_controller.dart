import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class StatistikController extends GetxController {
  final RxList<double> values = <double>[0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0].obs;
  final RxString reading = 'Belum ada data membaca'.obs;
  final RxString counting = 'Belum ada data berhitung'.obs;

  Future<void> fetchWeeklyStat() async {
    try {
      final res = await http.get(
        Uri.parse('http://192.168.1.13:8000/api/statistik/weekly/1'),
      );
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        values.assignAll(
          List<double>.from(data['values'].map((v) => v.toDouble())),
        );
        reading.value = data['reading'];
        counting.value = data['counting'];
      }
    } catch (e) {
      debugPrint('❌ Failed fetch weekly stat: $e');
    }
  }
}

import 'package:get/get.dart';

class TaskController extends GetxController{
  final RxString question = "pertanyaan".obs;
  final RxString taskType = 'baca'.obs;
  final RxString imageUrl = ''.obs;
  final RxList<String> options = <String>[
    'A',
    'B',
    'C',
  ].obs;
  final RxString selectedAnswer = ''.obs;

  void selectAnswer(String value) {
    selectedAnswer.value = value;
  }

}
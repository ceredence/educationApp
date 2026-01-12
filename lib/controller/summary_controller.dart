import 'package:get/get.dart';

class SummaryController extends GetxController {
  final correctAnswer = 0.obs;
  final wrongAnswer = 0.obs;
  final text = ''.obs;

  @override
void onInit() {
  super.onInit();

  final args = Get.arguments;
  if (args != null) {
    correctAnswer.value = args['correct'] ?? 0;
    wrongAnswer.value = args['wrong'] ?? 0;
    text.value = args['message'] ?? 'Kosong';
  }
}
}

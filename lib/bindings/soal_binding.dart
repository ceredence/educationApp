import 'package:dinacomapp/controller/soal_controller.dart';
import 'package:get/get.dart';

class SoalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SoalController>(() => SoalController());
  }
}

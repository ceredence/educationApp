import 'package:dinacomapp/controller/statistik_controller.dart';
import 'package:get/get.dart';

class StatistikBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatistikController>(() => StatistikController());
  }
}
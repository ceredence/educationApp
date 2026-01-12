import 'package:dinacomapp/controller/summary_controller.dart';
import 'package:get/get.dart';

class SummaryBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SummaryController>(() => SummaryController());
  }
}
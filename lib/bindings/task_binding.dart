import 'package:dinacomapp/controller/task_controller.dart';
import 'package:get/get.dart';

class TaskBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<TaskController>(() => TaskController());
  }

}
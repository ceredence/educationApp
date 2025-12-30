import 'package:dinacomapp/Components/task_widget.dart';
import 'package:dinacomapp/controller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TaskController>();

    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (taskController.isLoading.value) {
            return const Center(child: CircularProgressIndicator(),);
          }
              switch (taskController.taskType.value) {
                case 'baca':
                  return BacaTask();
                case 'tulis':
                  return TulisTask();
                case 'hitung':
                  return HitungTask();
                default:
                  return const SizedBox();
              }
            }
          ),
        ),
      );
  }
}

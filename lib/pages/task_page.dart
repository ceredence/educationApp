import 'package:dinacomapp/Components/task_widget.dart';
import 'package:dinacomapp/controller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final taskController = Get.find<TaskController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (taskController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          switch (taskController.taskType.value) {
            case 'baca':
              return const BacaTask();
            case 'tulis':
              return const TulisTask();
            case 'hitung':
              return const HitungTask();
            default:
              return const SizedBox();
          }
        }),
      ),
    );
  }
}

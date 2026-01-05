import 'package:dinacomapp/Components/custom_button.dart';
import 'package:dinacomapp/Components/custom_teks.dart';
import 'package:dinacomapp/controller/task_controller.dart';
import 'package:dinacomapp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TaskController>();
    final args = Get.arguments as Map;
    final int activityId = args['activityId'];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(myText: "Pilih level"),

              const SizedBox(height: 24),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1,
                children: List.generate(3, (index) {
                  final level = index + 1;

                  return ButtonHome(
                    onPressed: () async {
                      final selectedLevel = _mapLevel(level);
                      taskController.level.value = selectedLevel;

                      await taskController.startBatch(
                        activityId: activityId,
                        level: taskController.level.value,
                      );

                      await taskController.fetchQuestions(
                        activityCode: taskController.taskType.value,
                        level: _mapLevel(level),
                      );

                      Get.toNamed(AppRoutes.taskPage);
                    },
                    title: "Level $level",
                    level: level,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String _mapLevel(int level) {
  switch (level) {
    case 1:
      return 'low';
    case 2:
      return 'medium';
    case 3:
      return 'high';
    default:
      return 'low';
  }
}

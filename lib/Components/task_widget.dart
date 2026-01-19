import 'package:dinacomapp/Components/custom_button.dart';
import 'package:dinacomapp/Components/custom_teks.dart';
import 'package:dinacomapp/controller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class BacaTask extends StatelessWidget {
  const BacaTask({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TaskController>();

    return Container(
      height: double.infinity,
      padding: EdgeInsets.all(50),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image jika ada
          Obx(() {
            if (taskController.imageUrl.value.isNotEmpty) {
              return Column(
                children: [
                  Image.network(
                    taskController.imageUrl.value,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 30),
                ],
              );
            }
            return const SizedBox();
          }),

          // Question text
          Obx(() => CustomText(
                myText: taskController.question.value,
                fontColor: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),

          const SizedBox(height: 80),

          // Options buttons (vertical layout)
          Obx(() {
            if (taskController.options.isEmpty) {
              return const SizedBox();
            }

            return Column(
              children: taskController.options.map((opt) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: SizedBox(
                    width: 300,
                    child: CustomButton(
                      text: opt,
                      onPressed: () {
                        taskController.selectedAnswer.value = opt;
                        taskController.submitAndNext();
                      },
                    ),
                  ),
                );
              }).toList(),
            );
          }),
        ],
      ),
    );
  }
}

class HitungTask extends StatelessWidget {
  const HitungTask({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TaskController>();
    
    return Container(
      height: double.infinity,
      padding: EdgeInsets.all(50),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Progress indicator
          Obx(() => CustomText(
                myText: '${taskController.currentIndex.value + 1} / ${taskController.totalQuestions.value}',
                fontColor: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              )),

          const SizedBox(height: 30),

          // Question text
          Obx(() => CustomText(
                myText: taskController.question.value,
                fontColor: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),

          const SizedBox(height: 40),

          // Image
          Obx(() {
            if (taskController.imageUrl.value.isNotEmpty) {
              return Column(
                children: [
                  Image.network(
                    taskController.imageUrl.value,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 60),
                ],
              );
            }
            return const SizedBox();
          }),

          // Options buttons (vertical layout)
          Obx(() {
            if (taskController.options.isEmpty) {
              return const SizedBox();
            }

            return Column(
              children: taskController.options.map((opt) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: SizedBox(
                    width: 300,
                    child: CustomButton(
                      text: opt,
                      onPressed: () {
                        taskController.selectedAnswer.value = opt;
                        taskController.submitAndNext();
                      },
                    ),
                  ),
                );
              }).toList(),
            );
          }),
        ],
      ),
    );
  }
}

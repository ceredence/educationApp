import 'package:dinacomapp/Components/custom_button.dart';
import 'package:dinacomapp/Components/custom_option.dart';
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
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Obx(() {
              if (taskController.imageUrl.value.isNotEmpty) {
                return Image.network(
                  taskController.imageUrl.value,
                  height: 200,
                  fit: BoxFit.contain,
                );
              }
              return const SizedBox();
            }),

            const SizedBox(height: 20),

            Obx(
              () => CustomText(
                myText: taskController.question.value,
                fontColor: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 80),

            Obx(() {
              if (taskController.options.isEmpty) {
                return const SizedBox();
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: taskController.options
                    .map(
                      (opt) => CustomOption(
                        label: opt,
                        onPressed: () {
                          taskController.selectedAnswer.value = opt;
                          debugPrint(
                            'selected answer: ' +
                                taskController.selectedAnswer.value,
                          );
                        },
                      ),
                    )
                    .toList(),
              );
            }),

            SizedBox(height: 50),

            CustomButton(
              text: "Lanjut",
              onPressed: () {
                taskController.submitAndNext();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TulisTask extends StatelessWidget {
  const TulisTask({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TaskController>();

    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        children: [
          Obx(() {
            if (taskController.imageUrl.value.isNotEmpty) {
              return Image.network(
                taskController.imageUrl.value,
                height: 200,
                fit: BoxFit.contain,
              );
            }
            return const SizedBox();
          }),

          const SizedBox(height: 20),

          Obx(
            () => CustomText(
              myText: taskController.question.value,
              fontColor: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          CustomButton(
            text: "Lanjut",
            onPressed: () {
              taskController.submitAndNext();
            },
          ),
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
      child: Column(
        children: [
          Obx(() {
            if (taskController.imageUrl.value.isNotEmpty) {
              return Image.network(
                taskController.imageUrl.value,
                height: 200,
                fit: BoxFit.contain,
              );
            }
            return const SizedBox();
          }),

          const SizedBox(height: 12),

          Obx(
            () => CustomText(
              myText: taskController.question.value,
              fontColor: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: taskController.options
                  .map(
                    (opt) => CustomOption(
                      label: opt,
                      onPressed: () {
                        taskController.selectedAnswer.value = opt;
                        debugPrint(
                          'selected answer: ' +
                              taskController.selectedAnswer.value,
                        );
                      },
                    ),
                  )
                  .toList(),
            ),
          ),

          SizedBox(height: 50),

          CustomButton(
            text: "Lanjut",
            onPressed: () {
              taskController.submitAndNext();
            },
          ),
        ],
      ),
    );
  }
}

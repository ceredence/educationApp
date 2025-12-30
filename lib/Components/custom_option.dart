import 'package:dinacomapp/Components/custom_color.dart';
import 'package:dinacomapp/controller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOption extends StatelessWidget {
  final String label;
  const CustomOption({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TaskController>();
    
    return Obx(() {
      final isSelected = taskController.selectedAnswer.value == label;

      return GestureDetector(
        onTap: () => taskController.selectAnswer(label),
        child: Container(
          width: 100,
          height: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? CustomColor.tekscolor : CustomColor.button,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      );
    });
  }
}
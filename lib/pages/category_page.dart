import 'package:dinacomapp/Components/custom_button.dart';
import 'package:dinacomapp/Components/custom_teks.dart';
import 'package:dinacomapp/controller/task_controller.dart';
import 'package:dinacomapp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TaskController>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(myText: "Pilih materi"),

              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ButtonHome(
                      onPressed: () {
                        Get.toNamed(AppRoutes.levelPage);
                        taskController.taskType.value = 'baca';
                      },
                      icon: Icons.directions_run,
                      title: "Membaca",
                    ),
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: ButtonHome(
                      onPressed: () {
                        Get.toNamed(AppRoutes.levelPage);
                        taskController.taskType.value = 'tulis';
                      },
                      icon: Icons.description_outlined,
                      title: "Menulis",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ButtonHome(
                      onPressed: () {
                        Get.toNamed(AppRoutes.levelPage);
                        taskController.taskType.value = 'hitung';
                      },
                      icon: Icons.calculate_outlined,
                      title: "Berhitung",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:dinacomapp/Components/custom_button.dart';
import 'package:dinacomapp/Components/custom_teks.dart';
import 'package:dinacomapp/controller/task_controller.dart';
import 'package:dinacomapp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TaskController>();
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              
              // Header Text
              const Text(
                'Pilih Materi',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C2C2C),
                  letterSpacing: -0.5,
                ),
              ),
              
              const SizedBox(height: 8),
              
              const Text(
                'Ayo pilih materi yang ingin kamu pelajari!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF6B7280),
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 50),

              // Row 1: Membaca & Menulis
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonHome(
                    onPressed: () {
                      taskController.taskType.value = 'baca';
                      Get.toNamed(
                        AppRoutes.levelPage,
                        arguments: {'activityId': 2},
                      );
                    },
                    icon: Icons.menu_book_outlined,
                    title: "Membaca",
                  ),

                  const SizedBox(width: 20),

                  ButtonHome(
                    onPressed: () {
                      taskController.taskType.value = 'tulis';
                      Get.toNamed(
                        AppRoutes.levelPage,
                        arguments: {'activityId': 3},
                      );
                    },
                    icon: Icons.edit_outlined,
                    title: "Menulis",
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Row 2: Berhitung (centered)
              ButtonHome(
                onPressed: () {
                  taskController.taskType.value = 'hitung';
                  Get.toNamed(
                    AppRoutes.levelPage,
                    arguments: {'activityId': 1},
                  );
                },
                icon: Icons.calculate_outlined,
                title: "Berhitung",
              ),

              const Spacer(),

              // Kembali Button
              CustomButton(
                text: 'Kembali',
                onPressed: () {
                  Get.back();
                },
              ),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
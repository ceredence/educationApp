import 'package:dinacomapp/controller/testing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TestingPage extends StatelessWidget {
  TestingPage({super.key});

  final TestingController controller = Get.put(TestingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI Test UI")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller.promptController,
              decoration: const InputDecoration(
                hintText: "Masukkan prompt...",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            Obx(
              () => ElevatedButton(
                onPressed: controller.loading.value ? null : () => controller.sendPrompt(),
                child: controller.loading.value
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Send"),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Response:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Obx(
              () => Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  controller.responseText.isEmpty
                      ? "Hasil AI muncul disini..."
                      : controller.responseText.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

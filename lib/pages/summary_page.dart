import 'package:dinacomapp/Components/custom_button.dart';
import 'package:dinacomapp/controller/summary_controller.dart';
import 'package:dinacomapp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final summary = Get.find<SummaryController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),

              // TITLE
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Selamat!\nLatihan selesai 🌱",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // RESULT TEXT
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Obx(
                  () => Text(
                    summary.text.value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      height: 1.6,
                      color: Color(0xFF555555),
                    ),
                  ),
                ),
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: CustomButton(
                  text: "Kembali",
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.homePage);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

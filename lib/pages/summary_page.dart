import 'package:dinacomapp/controller/summary_controller.dart';
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

              const SizedBox(height: 40),

              // LOCKED STAT CARD
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAEAEA),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: const [
                    Icon(
                      Icons.lock_outline,
                      size: 36,
                      color: Color(0xFF777777),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Kerjakan beberapa soal lagi\n"
                      "untuk melihat statistik belajarmu",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

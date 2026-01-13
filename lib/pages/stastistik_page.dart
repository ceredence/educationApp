import 'package:flutter/material.dart';

class StatistikPage extends StatelessWidget {
  const StatistikPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(""),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Data Statistik Anak",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            const Text(
              "Minggu Ini",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 12),

            _chartBox(),

            const SizedBox(height: 24),

            _infoCard(
              title: "Reading",
              icon: Icons.menu_book,
              color: Colors.pinkAccent,
              description:
                  "Anak memiliki performa tinggi saat membaca. Bisa ditingkatkan kembali dengan lebih sering mengajak anak berbicara.",
            ),

            _infoCard(
              title: "Counting",
              icon: Icons.calculate,
              color: Colors.purpleAccent,
              description:
                  "Anak cenderung berada di soal penjumlahan dua angka lebih lama. Bisa ditingkatkan dengan memberikan contoh soal yang lebih simpel.",
            ),

            _infoCard(
              title: "Writing",
              icon: Icons.edit,
              color: Colors.pink,
              description:
                  "Anak bisa menulis kata dengan jelas. Bisa ditingkatkan dengan melanjutkan pada menulis satu kalimat.",
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text("Kembali", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ======================
  // CHART
  // ======================
  Widget _chartBox() {
    final days = [
      "Senin",
      "Selasa",
      "Rabu",
      "Kamis",
      "Jum'at",
      "Sabtu",
      "Minggu",
    ];

    final values = [3.0, 5.0, 8.0, 5.0, 6.5, 3.0, 2.0];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(days.length, (index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 22,
                height: values[index] * 15,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(height: 6),
              Text(days[index], style: const TextStyle(fontSize: 10)),
            ],
          );
        }),
      ),
    );
  }

  // ======================
  // INFO CARD
  // ======================
  Widget _infoCard({
    required String title,
    required IconData icon,
    required Color color,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(fontSize: 13, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

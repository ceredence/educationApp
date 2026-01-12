import 'package:dinacomapp/Components/custom_color.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEAF6FF),
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: CustomColor.oubtnhomebiru,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ======================
            // Avatar
            // ======================
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.lightBlue[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.face, size: 70, color: Colors.white),
            ),

            const SizedBox(height: 16),

            // ======================
            // DATA SISWA
            // ======================
            _sectionTitle("Data Siswa"),

            _profileItem("Nama Panggilan", "Tinus"),
            _profileItem("Nama Lengkap", "Agustinus Galih Gumilang"),
            _profileItem(
              "Catatan",
              "Tinus sulit fokus dan mudah terdistraksi saat belajar.",
            ),
            _profileItem("Jenis Kelamin", "Laki-laki"),
            _profileItem("Umur", "16"),

            const SizedBox(height: 24),

            // ======================
            // DATA PEMBIMBING
            // ======================
            _sectionTitle("Data Pembimbing"),

            _profileItem("Nama Pembimbing", "Esti Janitra Gumilang"),
            _profileItem("Email", "agustingalih@gmail.com"),
            _profileItem("No. HP", "08xxxxxxxxxx"),
            _profileItem(
              "Catatan",
              "Perlu pemantauan rutin dan laporan mingguan.",
            ),

            const SizedBox(height: 32),

            // ======================
            // BUTTON
            // ======================
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Kembali"),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // logout logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Log Out"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ======================
  // Widget Section Title
  // ======================
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // ======================
  // Widget Item Profile
  // ======================
  Widget _profileItem(String label, String value) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

import 'package:dinacomapp/Components/admin_textfield.dart';
import 'package:dinacomapp/Components/custom_button.dart';
import 'package:dinacomapp/Components/custom_dropdown.dart';
import 'package:dinacomapp/controller/soal_controller.dart';
import 'package:dinacomapp/model/admin_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final _formKey = GlobalKey<FormState>();

  final controller = Get.find<SoalController>();

  String question = "";
  String optionA = "";
  String optionB = "";
  String optionC = "";

  String? correctAnswer;
  String? level;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin - Tambah Soal"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Pertanyaan
              AdminTextField(
                hintText: "isi pertanyaan",
                onChanged: (value) {
                  question = value;
                },
                buttonText: "Tambahkan gambar",
                onButtonPressed: () {},
              ),

              const SizedBox(height: 16),

              /// Jawaban
              AdminTextField(
                hintText: "jawaban A",
                onChanged: (value) {
                  optionA = value;
                },
                buttonText: "Tambahkan gambar",
                onButtonPressed: () {},
              ),

              const SizedBox(height: 10),
              AdminTextField(
                hintText: "jawaban B",
                onChanged: (value) {
                  optionB = value;
                },
                buttonText: "Tambahkan gambar",
                onButtonPressed: () {},
              ),

              const SizedBox(height: 10),
              AdminTextField(
                hintText: "jawaban C",
                onChanged: (value) {
                  optionC = value;
                },
                buttonText: "Tambahkan gambar",
                onButtonPressed: () {},
              ),
              const SizedBox(height: 16),

              /// Jawaban yang benar
              const Text(
                "Jawaban Benar",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CustomDropdown<String>(
                hintText: "pilih jawaban yang benar",
                value: correctAnswer,
                items: const [
                  DropdownMenuItem(value: "A", child: Text("A")),
                  DropdownMenuItem(value: "B", child: Text("B")),
                  DropdownMenuItem(value: "C", child: Text("C")),
                ],
                onChanged: (value) {
                  setState(() {
                    correctAnswer = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              const Text(
                "Level Soal",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              CustomDropdown<String>(
                hintText: "pilih level",
                value: level,
                items: const [
                  DropdownMenuItem(value: "low", child: Text("Mudah")),
                  DropdownMenuItem(value: "medium", child: Text("Sedang")),
                  DropdownMenuItem(value: "high", child: Text("Sulit")),
                ],
                onChanged: (value) {
                  setState(() {
                    level = value!;
                  });
                },
              ),

              const SizedBox(height: 16),

              /// Level Soal
              const SizedBox(height: 24),

              /// Tombol Simpan
              CustomButton(
                text: "Simpan",
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;

                  if (correctAnswer == null || level == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Jawaban & level wajib dipilih"),
                      ),
                    );
                    return;
                  }

                  final soal = AdminModel(
                    question: question,
                    optionA: optionA,
                    optionB: optionB,
                    optionC: optionC,
                    answer: correctAnswer!,
                    level: level!,
                  );

                  await controller.tambahSoal(soal);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Soal berhasil disimpan")),
                  );

                  // reset form
                  setState(() {
                    question = "";
                    optionA = "";
                    optionB = "";
                    optionC = "";
                    correctAnswer = null;
                    level = null;
                  });
                },
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

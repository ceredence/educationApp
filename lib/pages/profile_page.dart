

class ProfilePage extends StatelessWidget {
   ProfilePage({super.key});
   final controller = Get.find<AuthController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================= HEADER =================
            Container(
              height: 220,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffA9D6FF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Stack(
                children: [
                  // icon wajah dummy dulu
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        height: 80,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.sentiment_very_satisfied,
                          size: 60,
                        ),
                      ),
                    ),
                  ),

                  // Foto profile
                  Positioned(
                    left: 24,
                    bottom: 20,
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: const Center(
                        child: Text(
                          "foto\nprofile",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ================= DATA SISWA =================
            _sectionTitle("Data Siswa"),

            _editableField("Nama Panggilan", "Tinus"),
            _editableField("Nama Lengkap", "Agustinus Galih Gumilang"),
            _editableMultiline(
              "Catatan",
              "Tinus sulit fokus dan mudah terdistraksi saat belajar. Ia membutuhkan instruksi singkat serta arahan bertahap agar dapat mengikuti pembelajaran dengan lebih baik.",
            ),

            _genderRadio(),
            _ageField("16"),

            const SizedBox(height: 30),

            // ================= DATA PEMBIMBING =================
            _sectionTitle("Data Pembimbing"),

            _editableField("Nama Panggilan", "Esta"),
            _editableField("Nama Lengkap", "Esta Janitra Gumilang"),
            _readOnlyField("Email", "agustinuzgalih@gmail.com"),

            _genderRadio(),
            _ageField("16"),

            const SizedBox(height: 32),

            // ================= BUTTON =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _actionButton(
                    text: "Kembali",
                    color: Color(0xffBFDFFF),
                    textColor: Colors.black,
                    onTap: () => Navigator.pop(context),
                  ),

                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ================= WIDGET =================

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _editableField(String label, String value) {
    return _baseContainer(
      child: Row(
        children: [
          Expanded(
            child: _labelValue(label, value),
          ),
          const Icon(Icons.edit, size: 18),
        ],
      ),
    );
  }

  Widget _editableMultiline(String label, String value) {
    return _baseContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _labelValue(label, value),
          ),
          const Icon(Icons.edit, size: 18),
        ],
      ),
    );
  }

  Widget _readOnlyField(String label, String value) {
  return _baseContainer(
    child: Row(
      children: [
        Expanded(
          child: _labelValue(label, value),
        ),
        const Opacity(
          opacity: 0, // tetap makan ruang tapi tidak terlihat
          child: Icon(Icons.edit, size: 18),
        ),
      ],
    ),
  );
}


  Widget _genderRadio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Jenis Kelamin",
              style: TextStyle(fontSize: 13, color: Colors.grey)),
          SizedBox(height: 6),
          Row(
            children: [
              Radio(value: 1, groupValue: 2, onChanged: null),
              Text("Laki - laki"),
              SizedBox(width: 20),
              Radio(value: 2, groupValue: 2, onChanged: null),
              Text("Perempuan"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _ageField(String age) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(age),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.edit, size: 18),
        ],
      ),
    );
  }

  Widget _actionButton({
    required String text,
    required Color color,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
      ),
    );
  }

  Widget _baseContainer({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }

  Widget _labelValue(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(value,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

import 'package:dinacomapp/routes/routes.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleAuthController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User?> user = Rx<User?>(null);
  RxBool isGoogleLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    user.bindStream(_auth.authStateChanges());
  }

  Future<void> signInWithGoogle() async {
    try {
      isGoogleLoading.value = true;

      // 🔹 Login Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        isGoogleLoading.value = false;
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);

      // 🔹 Ambil user dari Firebase
      final user = _auth.currentUser;
      if (user != null) {
        // Simpan hanya email ke SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', user.email ?? '-');

        // Snackbar sukses
        Get.snackbar(
          "Login Berhasil",
          "Email: ${user.email ?? '-'}",
          snackPosition: SnackPosition.BOTTOM,
        );

        // 🔹 Arahkan ke halaman utama
        Get.offAllNamed(AppRoutes.homePage);
      }
    } catch (e) {
      Get.snackbar(
        "Login Gagal",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isGoogleLoading.value = false;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // 🔹 Kembali ke halaman login
    Get.offAllNamed(AppRoutes.loginPage);
  }
}

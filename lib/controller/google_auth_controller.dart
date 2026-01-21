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

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);

      final user = _auth.currentUser;
      if (user != null) {
        final prefs = await SharedPreferences.getInstance();

        // 🔑 WAJIB UNTUK SPLASH
        await prefs.setString('login_type', 'google');
        await prefs.setString('email', user.email ?? '-');

        Get.snackbar(
          "Login Berhasil",
          "Email: ${user.email ?? '-'}",
          snackPosition: SnackPosition.TOP,
        );

        Get.offAllNamed(AppRoutes.homePage);
      }
    } catch (e) {
      Get.snackbar(
        "Login Gagal",
        e.toString(),
        snackPosition: SnackPosition.TOP,
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

    Get.offAllNamed(AppRoutes.loginPage);
  }
}

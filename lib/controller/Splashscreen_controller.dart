import 'package:dinacomapp/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  Future<void> checkLogin() async {
    await Future.delayed(const Duration(seconds: 3));

    final prefs = await SharedPreferences.getInstance();
    final loginType = prefs.getString('login_type');

    // 🔹 GOOGLE USER
    if (loginType == 'google' && FirebaseAuth.instance.currentUser != null) {
      Get.offAllNamed(AppRoutes.homePage);
      return;
    }

    // 🔹 USER BIASA
    if (loginType == 'manual' && prefs.getBool('is_logged_in') == true) {
      Get.offAllNamed(AppRoutes.taskPage);
      return;
    }

    // 🔹 BELUM LOGIN
    Get.offAllNamed(AppRoutes.startPage);
  }
}

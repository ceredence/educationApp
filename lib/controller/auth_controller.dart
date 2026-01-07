import 'package:dinacomapp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool isLoading = false.obs;

  void login() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Username dan password wajib diisi");
      return;
    }

    try {
      isLoading.value = true;

      // 🔹 simulasi login
      await Future.delayed(const Duration(seconds: 1));

      if (username == "admin" && password == "123456") {
        final prefs = await SharedPreferences.getInstance();

        // 🔑 WAJIB INI
        await prefs.setString("login_type", "manual");
        await prefs.setBool("is_logged_in", true);
        await prefs.setString("username", username);

        Get.offAllNamed(AppRoutes.homePage);
      } else {
        Get.snackbar("Login gagal", "Username atau password salah");
      }
    } finally {
      isLoading.value = false;
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Get.offAllNamed(AppRoutes.loginPage);
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

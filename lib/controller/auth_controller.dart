import 'dart:convert';

import 'package:dinacomapp/model/register_model.dart';
import 'package:dinacomapp/pages/login_page.dart';
import 'package:dinacomapp/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool isLoading = false.obs;

  // Emulator Android
  final String baseUrl = "http://192.168.1.15:8000/api";

  Future<void> register() async {
    if (usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar("Error", "Semua field wajib diisi");
      return;
    }

    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse("$baseUrl/register"),
        headers: {"Accept": "application/json"},
        body: {
          "username": usernameController.text.trim(),
          "email": emailController.text.trim(),
          "password": passwordController.text.trim(),
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final welcome = welcomeFromJson(response.body);

        Get.snackbar("Sukses", "Register ${welcome.user.username} berhasil");

        clearForm();
        Get.offAll(() => LoginPage());
      } else {
        final error = json.decode(response.body);
        Get.snackbar("Register gagal", error["message"] ?? "Terjadi kesalahan");
      }
    } catch (e) {
      Get.snackbar("Error", "Gagal koneksi ke server");
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Username dan password wajib diisi");
      return;
    }

    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: {"Accept": "application/json"},
        body: {
          "username": usernameController.text.trim(),
          "password": passwordController.text.trim(),
        },
      );

      if (response.statusCode == 200) {
        final welcome = welcomeFromJson(response.body);

        debugPrint("🔥 TOKEN DARI API: ${welcome.token}");
        debugPrint("🔥 USERNAME: ${welcome.user.username}");

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("login_type", "manual");
        await prefs.setBool("is_logged_in", true);
        await prefs.setInt("user_id", welcome.user.id);
        await prefs.setString("username", welcome.user.username);
        await prefs.setString("email", welcome.user.email);

        await prefs.setString("token", welcome.token);

        Get.offAllNamed(AppRoutes.homePage);
      } else {
        final error = json.decode(response.body);
        Get.snackbar(
          "Login gagal",
          error["message"] ?? "Username atau password salah",
        );
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // ================= LOGOUT =================
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    final loginType = prefs.getString("login_type");

    // kalau google → signOut firebase juga
    if (loginType == "google") {
      await FirebaseAuth.instance.signOut();
    }

    await prefs.clear();

    Get.offAllNamed(AppRoutes.splashPage);
  }

  // ================= UTIL =================
  void clearForm() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

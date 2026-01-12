import 'package:dinacomapp/Components/custom.textfild.dart';
import 'package:dinacomapp/Components/custom_button.dart';
import 'package:dinacomapp/Components/custom_teks.dart';
import 'package:dinacomapp/controller/auth_controller.dart';
import 'package:dinacomapp/controller/google_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final controller = Get.find<GoogleAuthController>();
  final loginc = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              height:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomText(
                    myText: "Welcome Back",
                    align: TextAlign.center,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 32),

                  CustomTextFild(
                    hintText: 'Username',
                    keyboardType: TextInputType.name,
                    controller: loginc.usernameController,
                  ),
                  const SizedBox(height: 12),

                  CustomTextFild(
                    hintText: 'Password',
                    isPassword: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: loginc.passwordController,
                  ),
                  const SizedBox(height: 24),

                   Obx(
                    () => CustomButton(
                      text: loginc.isLoading.value ? 'Loading...' : 'Login',
                      onPressed: loginc.login,
                    ),
                  ),

                  CustomButton(
                    text: 'Continue With Google',
                    onPressed: () {
                      controller.signInWithGoogle();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

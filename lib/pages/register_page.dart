import 'package:dinacomapp/Components/custom.textfild.dart';
import 'package:dinacomapp/Components/custom_button.dart';
import 'package:dinacomapp/Components/custom_teks.dart';
import 'package:dinacomapp/controller/auth_controller.dart';

import 'package:dinacomapp/controller/google_auth_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final controller1 = Get.find<AuthController>();
  final controller = Get.find<GoogleAuthController>();

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
                    myText: "Buat Akun",
                    align: TextAlign.center,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 32),

                  CustomTextFild(
                    hintText: 'Nama',
                    keyboardType: TextInputType.emailAddress,
                    controller: controller1.usernameController,
                  ),
                  const SizedBox(height: 12),

                  CustomTextFild(
                    hintText: 'Email',
                    keyboardType: TextInputType.name,
                    controller: controller1.emailController,
                  ),
                  const SizedBox(height: 12),

                  CustomTextFild(
                    hintText: 'Sandi',
                    isPassword: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: controller1.passwordController,
                  ),
                  const SizedBox(height: 12),


                  CustomTextFild(
                    hintText: 'Konfirmasi Sandi',
                    isPassword: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 24),


                  // CustomTextFild(
                  //   hintText: 'Confirm Password',
                  //   isPassword: true,
                  //   keyboardType: TextInputType.visiblePassword,
                  // ),
                  // const SizedBox(height: 24),
                  CustomButton(
                    text: 'Daftar',
                    onPressed: () {
                      controller1.register();
                    },
                  ),

                  CustomButton(text: 'Lanjutkan dengan Google', onPressed:(){
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




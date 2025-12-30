import 'package:dinacomapp/Components/custom.textfild.dart';
import 'package:dinacomapp/Components/custom_button.dart';
import 'package:dinacomapp/Components/custom_teks.dart';
import 'package:dinacomapp/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                    myText: "Create An Account",
                    align: TextAlign.center,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 32),

                  CustomTextFild(hintText:'Email',
                  keyboardType: TextInputType.emailAddress ,
                  ),
                  const SizedBox(height: 12),

                  CustomTextFild(
                    hintText: 'Username',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 12),

                  CustomTextFild(
                    hintText: 'Password',
                    isPassword: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 12),
                  CustomTextFild(
                    hintText: 'Confirm Password',
                    isPassword: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 24),

                  CustomButton(
                    text: 'Login',
                    onPressed: () {
                      Get.offAll(() => LoginPage());
                    },
                  ),
                  CustomButton(text: 'Continue With Google', onPressed:(){
                    debugPrint('Cetas Login');
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


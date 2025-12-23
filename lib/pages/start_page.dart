import 'package:dinacomapp/Components/custom_button.dart';
import 'package:dinacomapp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class StartPage extends StatelessWidget {
 StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            /// Top Card
            Positioned(
              top: 32,
              left: 24,
              right: 24,
              child: Container(
                height: size.height * 0.5,
                decoration: BoxDecoration(
                  color: const Color(0xFFEEEDE8),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            /// Blue Circle
            Positioned(
              top: size.height * 0.42,
              left: -size.width * 0.25,
              child: Container(
                width: size.width * 1.5,
                height: size.width * 1.5,
                decoration: const BoxDecoration(
                  color: Color(0xFFAFD6FB),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            /// Title
            Positioned(
              top: size.height * 0.52,
              left: 0,
              right: 0,
              child: const Text(
                'Hello! lets \nget into it',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  color: Color(0xFF696969),
                  fontFamily: 'Dela Gothic One',
                  height: 1.2,
                ),
              ),
            ),

            /// Login Button
            Positioned(
              top: size.height * 0.65,
              left: 24,
              right: 24,
              child: CustomButton(
                text: "Login",
                
                onPressed: () {
                  Get.offAllNamed(AppRoutes.homePage);
                  debugPrint("Login ditekan");
                },
              ),
            ),

            /// Terms
            Positioned(
              bottom: 24,
              left: 24,
              right: 24,
              child: Text.rich(
                TextSpan(
                  children: const [
                    TextSpan(
                      text:
                          'By tapping Sign In and Play with Blippy, you agree to our ',
                      style: TextStyle(
                        color: Color(0xFF777777),
                        fontSize: 13,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    TextSpan(
                      text: 'Terms',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

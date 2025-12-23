import 'package:dinacomapp/Components/custom_teks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: true,
       body: SafeArea(
        child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 1),
                      child: CustomText(myText: "Welcome Back"),
                    )
                  ],
                )
              ],
            ),
            )
        ],
       )),
    );
  }
}
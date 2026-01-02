import 'package:dinacomapp/routes/pages.dart';
import 'package:dinacomapp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Background message handler

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.adminPage,
      getPages: AppPages.pages,
    );
  }
}

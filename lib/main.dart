import 'package:dinacomapp/routes/pages.dart';
import 'package:dinacomapp/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Background message handler

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ WAJIB
  await Firebase.initializeApp();         
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Blippy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 53, 49, 59)),
      ),
      initialRoute: AppRoutes.homePage,
      getPages: AppPages.pages,
    );
  }
}

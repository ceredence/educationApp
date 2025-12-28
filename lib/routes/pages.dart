import 'package:dinacomapp/pages/home_page.dart';
import 'package:dinacomapp/pages/start_page.dart';
import 'package:dinacomapp/pages/task_page.dart';
import 'package:dinacomapp/pages/testing_page.dart';
import 'package:dinacomapp/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.testingPage, page: () => TestingPage()),
    GetPage(name: AppRoutes.startPage, page: () => StartPage()),
    GetPage(name: AppRoutes.homePage, page: () => HomePage()),
  ];
}
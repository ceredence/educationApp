import 'package:dinacomapp/bindings/auth_binding.dart';
import 'package:dinacomapp/bindings/soal_binding.dart';
import 'package:dinacomapp/bindings/splash_binding.dart';
import 'package:dinacomapp/bindings/summary_binding.dart';
import 'package:dinacomapp/bindings/task_binding.dart';
import 'package:dinacomapp/pages/admin_page.dart';
import 'package:dinacomapp/pages/category_page.dart';
import 'package:dinacomapp/pages/home_page.dart';
import 'package:dinacomapp/pages/level_page.dart';
import 'package:dinacomapp/pages/login_page.dart';
import 'package:dinacomapp/pages/profile_page.dart';
import 'package:dinacomapp/pages/register_page.dart';
import 'package:dinacomapp/pages/splash_page.dart';
import 'package:dinacomapp/pages/start_page.dart';
import 'package:dinacomapp/pages/stastistik_page.dart';
import 'package:dinacomapp/pages/summary_page.dart';
import 'package:dinacomapp/pages/task_page.dart';
import 'package:dinacomapp/pages/testing_page.dart';
import 'package:dinacomapp/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.testingPage, page: () => TestingPage()),
    GetPage(name: AppRoutes.startPage, page: () => StartPage()),
    GetPage(name: AppRoutes.homePage, page: () => HomePage(), binding: TaskBinding()),
    GetPage(name: AppRoutes.levelPage, page: () => LevelPage(), binding: TaskBinding()), 
    GetPage(name: AppRoutes.categoryPage, page: () => CategoryPage(), binding: TaskBinding()),
    GetPage(name: AppRoutes.taskPage, page: () => TaskPage(), binding: TaskBinding()),
    GetPage(name: AppRoutes.adminPage, page: () => AdminPage(),binding: SoalBinding()),
    GetPage(name: AppRoutes.loginPage, page: () => LoginPage(),bindings: [AuthBinding(),]),
    GetPage(name: AppRoutes.splashPage, page: () => SplashPage(),binding: SplashBinding()),
    GetPage(name: AppRoutes.registerPage, page: () => RegisterPage(),bindings: [AuthBinding()]),
    GetPage(name: AppRoutes.summaryPage, page: () => SummaryPage(), binding: SummaryBinding()),
    GetPage(name: AppRoutes.profilePage, page: () => ProfilePage()),
    GetPage(name: AppRoutes.adminPage, page: () => AdminPage()),
    GetPage(name: AppRoutes.summaryPage, page: () => SummaryPage(), binding: SummaryBinding()),
    GetPage(name: AppRoutes.statistikPage, page: () => StatistikPage()),
  ];
}
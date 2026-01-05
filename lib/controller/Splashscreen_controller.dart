
import 'package:dinacomapp/routes/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkLogin();
  }

  void checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 3));
    if (prefs.getString("username") != null) {
      
      Get.offAllNamed(AppRoutes.homePage);
    } else {
      
      Get.offAllNamed(AppRoutes.startPage);
    }
  }
}
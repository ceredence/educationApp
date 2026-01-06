import 'package:dinacomapp/controller/google_auth_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoogleAuthController>(() => GoogleAuthController());
  }
}

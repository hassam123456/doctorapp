import 'package:doctorapp/controller/authcontroller.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(authRepo: Get.find()));
  }
}

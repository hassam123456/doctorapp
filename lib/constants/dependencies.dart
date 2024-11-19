import 'package:doctorapp/constants/api_service.dart';
import 'package:doctorapp/repositary/adminRepo.dart';
import 'package:doctorapp/repositary/authRepo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //Api Clients
  Get.lazyPut(() => HttpApiClient());
  Get.lazyPut(() => AuthRepo(apiClient: Get.find()));
  Get.lazyPut(() => AdminRepo(apiClient: Get.find()));
}

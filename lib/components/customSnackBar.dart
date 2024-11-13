import 'package:get/get.dart';

customSuccessSnackBar(String message) {
  return Get.snackbar("Success", message);
}

customErrorSnackBar(String message) {
  return Get.snackbar("Error", message);
}

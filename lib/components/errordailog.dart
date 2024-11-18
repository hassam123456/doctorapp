import 'package:doctorapp/constants/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_popup_dialogwhite.dart';

typedef ButtonPressed = VoidCallback;

showErrrorSnackbar({required String message}) {
  return Get.snackbar("Error", message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primaryColor,
      colorText: Colors.white);
}

showSuccessSnackbar({required String message}) {
  return Get.snackbar("Success", message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primaryColor,
      colorText: Colors.white);
}

void showSuccessDialogAndNavigateToLogin(
    context, String message, String routename) {
  Get.dialog(
    WhiteCustomPopupDialog(
      message: message,
      image: 'assets/images/sms 5.png',
    ),
  );
  Future.delayed(Duration(seconds: 2), () {
    Get.offAllNamed(routename);
  });
}

customcircularprogress() {
  return const CircularProgressIndicator(
    color: AppColors.primaryColor,
  );
}

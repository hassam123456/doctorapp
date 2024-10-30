import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController clinicNameController = TextEditingController();
  TextEditingController signupemailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController licenseController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController signuppasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController changepasswordController = TextEditingController();
  TextEditingController changeconfirmpasswordController =
      TextEditingController();

  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  @override
  void onInit() {
    super.onInit();
    emailController.clear();
    passwordController.clear();
    fullNameController.clear();
    clinicNameController.clear();
    signupemailController.clear();
    phoneController.clear();
    addressController.clear();
    licenseController.clear();
    specializationController.clear();
    experienceController.clear();
    signuppasswordController.clear();
    confirmPasswordController.clear();
  }
}

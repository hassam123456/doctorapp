import 'package:doctorapp/repositary/authRepor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  AuthRepo authRepo;
  AuthController({required this.authRepo});
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

////////////signup
  final RxBool signuploading = false.obs;
  Future<void> signup(String isUser) async {
    try {
      signuploading.value = true;
      await authRepo.signUp(
        isUser: isUser,
        name: fullNameController.value.text.toString(),
        email: signupemailController.value.text.toString(),
        hospitalname: clinicNameController.value.text.toString(),
        phone: phoneController.value.text.toString(),
        address: addressController.value.text.toString(),
        licensenumber: licenseController.value.text.toString(),
        specialization: specializationController.value.text.toString(),
        experience: experienceController.value.text.toString(),
        password: passwordController.value.text.toString(),
      );

      signuploading.value = false;
    } finally {
      signuploading.value = false;
    }
  }

////////signup email verification
  final RxBool signupemailverificationloading = false.obs;
  final RxString signupemailverificationotp = ''.obs;
  RxList<TextEditingController> emailverifycontrollers =
      RxList.generate(5, (_) => TextEditingController());
  Future<void> emailVerification(
      {required String isUser,
      required String email,
      required String otp,
      required BuildContext context}) async {
    try {
      signupemailverificationloading.value = true;
      await authRepo.emailVerification(
          context: context, isUser: isUser, otp: otp, email: email);

      signupemailverificationloading.value = false;
    } finally {
      signupemailverificationloading.value = false;
    }
  }

////////send otp
  final RxBool resendotploading = false.obs;
  Future<void> reSendOTP(
      {required String isUser, required String email}) async {
    try {
      resendotploading.value = true;
      await authRepo.reSendOTP(
          isUser: isUser.toString(), email: email.toString());

      resendotploading.value = false;
    } finally {
      resendotploading.value = false;
    }
  }
}

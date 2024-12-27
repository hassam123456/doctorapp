import 'dart:io';

import 'package:doctorapp/constants/routeconstants.dart';
import 'package:doctorapp/model/profilemodel.dart';
import 'package:doctorapp/repositary/authRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  AuthRepo authRepo;
  AuthController({required this.authRepo});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  File? uploadedProfileImage;
  final formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController clinicNameController = TextEditingController();
  TextEditingController signupemailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final addressController = TextEditingController().obs;
  final licenseController = TextEditingController().obs;
  final specializationController = TextEditingController().obs;
  final experienceController = TextEditingController().obs;
  TextEditingController signuppasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController changepasswordController = TextEditingController();
  TextEditingController changeconfirmpasswordController =
      TextEditingController();

  TextEditingController forgotemailController = TextEditingController();

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
    addressController.value.clear();
    licenseController.value.clear();
    specializationController.value.clear();
    experienceController.value.clear();
    signuppasswordController.clear();
    confirmPasswordController.clear();
  }

  ////getprofiledata
  final RxBool profiledataloading = false.obs;
  final Rx<ProfileModel?> profiledatalist = Rx<ProfileModel?>(null);
  getprofiledata() async {
    try {
      profiledataloading(true);
      await authRepo.GetProfileData().then((value) {
        profiledatalist.value = value;
        profiledataloading(false);
      });
    } catch (e) {
      profiledataloading(false);
    }
  }

  ////updateprofiledata
  var profilestatusmessage = '';
  var upprofiledataloading = false.obs;
  final profilenamecontroller = TextEditingController().obs;
  final profilelastnamecontroller = TextEditingController().obs;
  final addressscontroller = TextEditingController().obs;
  final profileemailcontroller = TextEditingController().obs;
  final profilephonecontroller = TextEditingController().obs;
  final profilespecializationcontroller = TextEditingController().obs;
  final profilehospitalnamecontroller = TextEditingController().obs;
  final profilexperiencecontroller = TextEditingController().obs;
  final profilelicesnsecontroller = TextEditingController().obs;
  updateprofiledata() async {
    try {
      upprofiledataloading(true);
      await authRepo
          .updateprofiledata(
        profilehospitalname: profilehospitalnamecontroller.value.text.isEmpty
            ? profiledatalist.value?.data!.profile!.hospitalName ??
                'Hospital Name'
            : profilehospitalnamecontroller.value.text,
        specialization: profilespecializationcontroller.value.text.isEmpty
            ? profiledatalist.value?.data!.profile!.specialization ??
                'Specialization'
            : profilespecializationcontroller.value.text,
        profileimage: uploadedProfileImage,
        profilename: profilenamecontroller.value.text.isEmpty
            ? profiledatalist.value?.data!.profile!.name ?? 'Name'
            : profilenamecontroller.value.text,
        phone_number: profilephonecontroller.value.text.isEmpty
            ? profiledatalist.value?.data!.profile!.phoneNumber ?? 'phoneNumber'
            : profilephonecontroller.value.text,
        experience: profilexperiencecontroller.value.text.isEmpty
            ? profiledatalist.value?.data!.profile!.experience ?? 'experience'
            : profilexperiencecontroller.value.text,
        licesnsenumber: profilelicesnsecontroller.value.text.isEmpty
            ? profiledatalist.value?.data!.profile!.licenseNumber ??
                "licenseNumber"
            : profilelicesnsecontroller.value.text,
        profileaddress: addressscontroller.value.text.isEmpty
            ? profiledatalist.value?.data!.profile!.address ?? 'Address'
            : addressscontroller.value.text.toString(),
        // profilehospitalname:  ,
      )
          .then((value) {
        //after successfullu submission then remove data

        uploadedProfileImage = null;
        profilenamecontroller.value.clear();
        profilelastnamecontroller.value.clear();
        profileemailcontroller.value.clear();
        profilephonecontroller.value.clear();
        profilehospitalnamecontroller.value.clear();
        profilexperiencecontroller.value.clear();
        upprofiledataloading(false);
      });
    } catch (e) {
      print("Error in Update Profile Info: $e");
      upprofiledataloading(false);
    }
  }

////////////signup
  final RxBool signuploading = false.obs;
  Future<void> signup() async {
    try {
      signuploading.value = true;
      await authRepo.signUp(
        // isUser: isUser,
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
      {
      // required Sting isUser,
      required String type,
      required String email,
      required String otp,
      required BuildContext context}) async {
    try {
      signupemailverificationloading.value = true;
      await authRepo.emailVerification(
          context: context, otp: otp, email: email, type: type);

      signupemailverificationloading.value = false;
    } finally {
      signupemailverificationloading.value = false;
    }
  }

////////send otp
  final RxBool resendotploading = false.obs;
  Future<void> reSendOTP({required String email}) async {
    try {
      resendotploading.value = true;
      await authRepo.reSendOTP(email: email.toString());

      resendotploading.value = false;
    } finally {
      resendotploading.value = false;
    }
  }

///////send otp
  var sendotploading = false.obs;
  Future<void> sendOTP({
    required String type,
    // required String logintyp,
  }) async {
    try {
      print("send otp check");
      print(type);
      // print(logintyp);
      sendotploading.value = true;
      await authRepo.SendOTP(
          // isuser: logintyp,
          email: forgotemailController.value.text.toString(),
          type: type.toString());

      sendotploading.value = false;
    } finally {
      sendotploading.value = false;
    }
  }

  //////////verify otp api
  var verifyotploading = false.obs;
  final otpcontroller = TextEditingController().obs;
  Future<void> VerifyOTP(
      {required BuildContext context,
      String? type,
      required String isuser,
      required String popupmessage}) async {
    try {
      verifyotploading.value = true;
      await authRepo.VerifyOTP(
          isuser: isuser,
          otp: otpcontroller.value.text.toString(),
          email: forgotemailController.value.text.toString(),
          type: type!,
          context: context,
          popupmessage: popupmessage);

      verifyotploading.value = false;
    } finally {
      verifyotploading.value = false;
    }
  }

///////change password
  var changepasswordloading = false.obs;
  final changepasswordcontroller = TextEditingController().obs;
  final changeconfpasswordcontroller = TextEditingController().obs;
  Future<void> changePassword({
    required String email,
    required BuildContext context,
  }) async {
    try {
      changepasswordloading.value = true;
      await authRepo.changepassword(
          email: email,
          password: changepasswordcontroller.value.text.toString(),
          newpassword: changeconfpasswordcontroller.value.text.toString(),
          context: context);

      changepasswordloading.value = false;
    } finally {
      changepasswordloading.value = false;
    }
  }

  // login api
  var loginloading = false.obs;
  Future<void> login(
      // required String? isuser,
      ) async {
    try {
      loginloading.value = true;
      await authRepo.login(
          // isuser: isuser.toString(),
          email: emailController.value.text.toString(),
          password: passwordController.value.text.toString());

      // remembermeischecked.value
      //     ? saveremembermecredentials(
      //         email: loginemailcontroller.value.text.toString(),
      //         password: loginpasswordcontroller.value.text.toString(),
      //         isremeberme: remembermeischecked.value)
      //     : clearremebermecredentials();

      loginloading.value = false;
    } finally {
      loginloading.value = false;
    }
  }

///////////logout
  void logout() async {
    Get.offAllNamed(RouteConstants.loginpage);
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('email');
    await prefs.remove('isuser');
  }
}

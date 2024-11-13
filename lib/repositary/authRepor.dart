import 'dart:convert';

import 'package:doctorapp/components/customSnackBar.dart';
import 'package:doctorapp/components/custompopup.dart';
import 'package:doctorapp/constants/api_service.dart';
import 'package:doctorapp/constants/appconstant.dart';
import 'package:doctorapp/constants/routeconstants.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthRepo extends GetxService {
  HttpApiClient apiClient;
  AuthRepo({required this.apiClient});

///////////signup
  Future signUp({
    required String isUser,
    required String name,
    required String email,
    required String hospitalname,
    required String phone,
    required String address,
    required String licensenumber,
    required String specialization,
    required String experience,
    required String password,
  }) async {
    final userData = {
      "name": name,
      "email": email,
      "password": password,
      "address": address,
      "specialization": specialization,
      // "phone_code":"+1",
      "phone_number": phone,
      "is_user": isUser,
      "hospital_name": hospitalname,
      "license_number": licensenumber,
      "experience": experience
    };
    try {
      final response = await apiClient.postToServer(
        endPoint: AppConstants.signup,
        data: userData,
      );
      if (response.statusCode == 200) {
        final message = jsonDecode(response.body)['message'];
        customSuccessSnackBar(message);
        Get.toNamed(RouteConstants.emailverification,
            arguments: {'email': email, 'isUser': isUser});
      } else {
        final message = jsonDecode(response.body)['message'];
        customErrorSnackBar(message);
      }
    } catch (e) {
      customErrorSnackBar(
          'An unexpected error occurred. Please try again later. $e');
    }
  }

//////////////email verification
  Future emailVerification({
    required BuildContext context,
    required String isUser,
    required String otp,
    required String email,
  }) async {
    final userData = {
      "email": email,
      "otp": otp,
      "type": "0", //0 for email verification 1 for forgot password
      "is_user": isUser
    };
    try {
      final response = await apiClient.postToServer(
        endPoint: AppConstants.signupemailverification,
        data: userData,
      );
      if (response.statusCode == 200) {
        final message = jsonDecode(response.body)['message'];
        showVerificationPopup(context, "Verification Done!", message);
        await Future.delayed(Duration(seconds: 3));
        Get.offAllNamed(RouteConstants.splashscreen);
      } else {
        final message = jsonDecode(response.body)['message'];
        customErrorSnackBar(message);
      }
    } catch (e) {
      customErrorSnackBar(
          'An unexpected error occurred. Please try again later. $e');
    }
  }

/////////////resend otp
  Future reSendOTP({
    required String isUser,
    required String email,
  }) async {
    final userData = {
      "email": email,
      "type": "0", //0 for email verification 1 for forgot password
      "is_user": isUser
    };
    try {
      final response = await apiClient.postToServer(
        endPoint: AppConstants.resendotp,
        data: userData,
      );
      if (response.statusCode == 200) {
        final message = jsonDecode(response.body)['message'];
        customSuccessSnackBar(message);
      } else {
        final message = jsonDecode(response.body)['message'];
        customErrorSnackBar(message);
      }
    } catch (e) {
      print("Send Otp:$e");
      customErrorSnackBar(
          'An unexpected error occurred. Please try again later.');
    }
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:doctorapp/model/profilemodel.dart';
import 'package:http/http.dart' as http;
import 'package:doctorapp/components/customSnackBar.dart';
import 'package:doctorapp/components/custompopup.dart';
import 'package:doctorapp/components/errordailog.dart';
import 'package:doctorapp/constants/api_service.dart';
import 'package:doctorapp/constants/appconstant.dart';
import 'package:doctorapp/constants/local_storage.dart';
import 'package:doctorapp/constants/routeconstants.dart';
import 'package:doctorapp/model/ebookmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  //////PROFILE DATA REPO

  GetProfileData() async {
    try {
      final res = await apiClient.getFromServer(
        endPoint: AppConstants.getprofile,
      );
      print("Response Body of Profile Dataa: $res");
      final Map<String, dynamic> responseData = json.decode(res.body);
      if (res.statusCode == 200) {
        print(res.body);
        final listOfprofiledata =
            profileModelFromJson(json.encode(responseData));
        return listOfprofiledata;
      } else {
        throw Exception("No data field found in the GetProfileData");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // get profile setting
  /////////update seller profile data
  Future updatesellerprofiledata({
    required String profilename,
    required String profilehospitalname,
    required String profileaddress,
    required String licesnsenumber,
    required String specialization,
    required String experience,
    required String phone_number,
    required File? profileimage,
  }) async {
    final mapData = {
      "name": profilename,
      "hospital_name": profilehospitalname,
      "address": profileaddress,
      "license_number": licesnsenumber,
      "specialization": specialization,
      "experience": experience,
      "phone_number": phone_number,
    };
    Map<String, String> stringMapData =
        mapData.map((key, value) => MapEntry(key, value.toString()));
    // print(stringMapData);
    try {
      final res = await apiClient.postImagesToServer(
          endPoint: AppConstants.userupdateprofile,
          data: stringMapData,
          files: {
            "image": profileimage,
          });
      if (res.statusCode == 200) {
        // ignore: use_build_context_synchronously
        // Navigator.pop(context);
        final message = jsonDecode(res.body)['message'];
        showSuccessSnackbar(message: message);
      } else {
        final message = jsonDecode(res.body)['message'];
        showErrrorSnackbar(message: message);
      }
    } on SocketException {
      return showErrrorSnackbar(message: 'No Internet Connection');
    } catch (e) {
      showErrrorSnackbar(message: e.toString());
    }
  }

//////////////email verification
  Future emailVerification({
    required BuildContext context,
    required String isUser,
    required String otp,
    required String email,
    String? type,
  }) async {
    final userData = {
      "email": email,
      "otp": otp,
      "type": type,
      "is_user": isUser
    };
    try {
      final response = await apiClient.postToServer(
        endPoint: AppConstants.signupemailverification,
        data: userData,
      );
      if (response.statusCode == 200) {
        if (type == "1") {
          showSuccessSnackbar(message: "Email Verified");
          Get.toNamed(RouteConstants.changepassword, arguments: email);
        } else {
          final message = jsonDecode(response.body)['message'];
          showVerificationPopup(context, "Verification Done!", message);
          await Future.delayed(Duration(seconds: 2));
          Get.offAllNamed(RouteConstants.splashscreen);
        }
      } else {
        final message = jsonDecode(response.body)['message'];
        customErrorSnackBar(message);
      }
    } catch (e) {
      customErrorSnackBar(
          'An unexpected error occurred. Please try again later. $e');
    }
  }

//////////////VERIFY OTP API
  Future VerifyOTP({
    required String otp,
    required String email,
    required String type,
    required BuildContext context,
    required String popupmessage,
    required String isuser,
  }) async {
    final mapData = {
      "email": email.toString(),
      "otp": otp.toString(),
      "type": type,
      "is_user": isuser
    };
    try {
      final res = await apiClient.postToServer(
          endPoint: AppConstants.verifyotp, data: mapData);
      if (res.statusCode == 200) {
        if (type == "1") {
          showSuccessSnackbar(message: "Email Verified");
          Get.toNamed(RouteConstants.changepassword, arguments: email);
        } else {
          showSuccessDialogAndNavigateToLogin(
              context, popupmessage, RouteConstants.loginpage);
        }
      } else {
        final message = jsonDecode(res.body)['message'];
        showErrrorSnackbar(message: message);
      }
    } on SocketException {
      return showErrrorSnackbar(message: 'No Internet Connection');
    } catch (e) {
      showErrrorSnackbar(message: e.toString());
    }
  }

/////////////changepassword Api
  Future changepassword({
    required String email,
    required String password,
    required String newpassword,
    required BuildContext context,
  }) async {
    final mapData = {
      "email": email,
      "password": password,
      "new_password": newpassword,
      "is_user": "1"
    };
    try {
      final res = await apiClient.postToServer(
          endPoint: AppConstants.resetpassword, data: mapData);
      if (res.statusCode == 200) {
        showSuccessDialogAndNavigateToLogin(
            context, 'Password Successfully Setup', RouteConstants.loginpage);
      } else {
        final message = jsonDecode(res.body)['message'];
        showErrrorSnackbar(message: message);
      }
    } on SocketException {
      return showErrrorSnackbar(message: 'No Internet Connection');
    } catch (e) {
      showErrrorSnackbar(message: e.toString());
    }
  }

  ////Get Products By Search Key
  Future<EbookModel> GetProductsBySearchKey(String key) async {
    try {
      final res = await apiClient.getFromServer(
        // endPoint: AppConstants.getproductsserachbykey
        endPoint: "${AppConstants.ebooksearch}$key",
      );
      if (res.statusCode == 200) {
        print(res.body);
        final listofproductserachbykey = ebookModelFromJson(res.body);
        return listofproductserachbykey;
      } else {
        throw Exception("No data field found in the GetProductsBySearchKey");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //////////////send OTP API
  Future SendOTP({
    required String email,
    required String type,
    required String isuser,
  }) async {
    final mapData = {"email": email, "type": type, "is_user": isuser};
    try {
      print(mapData);
      final res = await apiClient.postToServer(
          endPoint: AppConstants.sendotp, data: mapData);
      if (res.statusCode == 200) {
        print(res.body);
        print(type);
        showSuccessSnackbar(message: "OTP Sent");
        Get.toNamed(RouteConstants.forgotemailverification,
            arguments: {'email': email, 'isUser': isuser});
      } else {
        final message = jsonDecode(res.body)['message'];
        showErrrorSnackbar(message: message);
      }
    } on SocketException {
      return showErrrorSnackbar(message: 'No Internet Connection');
    } catch (e) {
      showErrrorSnackbar(message: e.toString());
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

  Future login({
    required String isuser,
    required String email,
    required String password,
  }) async {
    // final guestUserId =
    // _generateRandomGuestUserId(); // Generate a random guest user ID

    final mapData = {"email": email, "password": password, "is_user": isuser};
    print(mapData);
    print(isuser);
    try {
      final res = await apiClient.postToServer(
        endPoint: AppConstants.login,
        data: mapData,
      );

      if (res.statusCode == 200) {
        print(res.body);
        showSuccessSnackbar(message: "Login");
        final token = jsonDecode(res.body)['data']['token'];

        print("login data");
        final prefs = await SharedPreferences.getInstance();
        // await LocalStorage().setString('guest_user_id', guestUserId);
        await prefs.setString('token', token);
        await prefs.setString('email', email);

        await LocalStorage().remove('guest_user_id');
        // gettoken();
        isuser == "1"
            ? Get.offAllNamed(RouteConstants.userbottomnavbar)
            : isuser == "2"
                ? Get.offAllNamed(RouteConstants.doctorbottomnavbar)
                : Get.offAllNamed(RouteConstants.adminhomescreen);
      } else {
        final message = jsonDecode(res.body)['message'];
        showErrrorSnackbar(message: message);
      }
    } on SocketException {
      return showErrrorSnackbar(message: 'No Internet Connection');
    } catch (e) {
      showErrrorSnackbar(message: e.toString());
    }
  }
}

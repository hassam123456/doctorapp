import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:doctorapp/components/customSnackBar.dart';
import 'package:doctorapp/constants/api_service.dart';
import 'package:doctorapp/constants/appconstant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminRepo extends GetxService {
  HttpApiClient apiClient;
  AdminRepo({required this.apiClient});

///////////admin create E-Book
  Future<void> creatEBook({
    required String title,
    required String category,
    required String url,
    required String description,
    required File ebookfile,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              '${AppConstants.apibaseurl}${AppConstants.admincreateEbook}'));
      request.fields.addAll({
        'title': title,
        'category': category,
        'url': url,
        'description': description,
      });
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        ebookfile.path,
      ));
      request.headers['Authorization'] = 'Bearer $token';
      var response = await request.send();
      final responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        Get.back();
        final message = jsonDecode(responseBody)['message'];
        customSuccessSnackBar(message);
      } else {
        final message = jsonDecode(responseBody)['message'];
        customErrorSnackBar(message);
      }
    } catch (e) {
      customErrorSnackBar(
          'An unexpected error occurred. Please try again later.');
      print("Error uploading EBook: $e");
    }
  }

///////////admin create video
  Future<void> creatVideo({
    required String title,
    required String category,
    required String url,
    required String description,
    required File videoFile,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              '${AppConstants.apibaseurl}${AppConstants.admincreatevideo}'));
      request.fields.addAll({
        'title': title,
        'category': category,
        'url': url,
        'description': description,
      });
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        videoFile.path,
      ));
      request.headers['Authorization'] = 'Bearer $token';
      var response = await request.send();
      final responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        Get.back();
        final message = jsonDecode(responseBody)['message'];
        customSuccessSnackBar(message);
      } else {
        final message = jsonDecode(responseBody)['message'];
        customErrorSnackBar(message);
      }
    } catch (e) {
      customErrorSnackBar(
          'An unexpected error occurred. Please try again later.');
      print("Error uploading video: $e");
    }
  }
}

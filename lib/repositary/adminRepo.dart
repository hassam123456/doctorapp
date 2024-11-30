import 'dart:convert';
import 'dart:io';
import 'package:doctorapp/constants/routeconstants.dart';
import 'package:doctorapp/model/adminconsultantmodel.dart';
import 'package:doctorapp/model/admingetcaseByIdModel.dart';
import 'package:doctorapp/model/consultantlistmodel.dart';
import 'package:doctorapp/model/ebookmodel.dart';
import 'package:doctorapp/model/videomodel.dart';
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

// get ebook data

  Future<EbookModel?> GetEbookdata() async {
    try {
      final res = await apiClient.getFromServer(
        endPoint: AppConstants.ebook,
      );

      if (res.statusCode == 200) {
        // print('notifcationoff');
        print("data");
        print(res.body);
        final listofebookdata = ebookModelFromJson(res.body);
        return listofebookdata;
      } else {
        throw Exception("No data field found in the Ebook data");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //consultant admin method
  Future<AdminConsultantList?> GetCaseAdmin() async {
    try {
      final res = await apiClient.getFromServer(
        endPoint: AppConstants.caseadmin,
      );

      if (res.statusCode == 200) {
        // print('notifcationoff');
        print("data");
        print(res.body);
        final listofamdincase = adminConsultantListFromJson(res.body);
        return listofamdincase;
      } else {
        throw Exception("No data field found in the admin case data");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //doctor case method
  Future<AdminConsultantList?> GetdoctorMethod() async {
    try {
      final res = await apiClient.getFromServer(
        endPoint: AppConstants.doctorcase,
      );

      if (res.statusCode == 200) {
        // print('notifcationoff');
        print("data");
        print(res.body);
        final listofamdincase = adminConsultantListFromJson(res.body);
        return listofamdincase;
      } else {
        throw Exception("No data field found in the admin case data");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //consultant user method
  Future<AdminConsultantList?> GetUserMethod() async {
    try {
      final res = await apiClient.getFromServer(
        endPoint: AppConstants.usercase,
      );

      if (res.statusCode == 200) {
        // print('notifcationoff');
        print("data");
        print(res.body);
        final listofamdincase = adminConsultantListFromJson(res.body);
        return listofamdincase;
      } else {
        throw Exception("No data field found in the admin case data");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //consultant doctor list method
  Future<ConsultantListModel?> Getconsultantlist() async {
    try {
      final res = await apiClient.getFromServer(
        endPoint: AppConstants.consultantlist,
      );

      if (res.statusCode == 200) {
        // print('notifcationoff');
        print("data");
        print(res.body);
        final listofconsultantmodel = consultantListModelFromJson(res.body);
        return listofconsultantmodel;
      } else {
        throw Exception("No data field found in the admin case data");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //video method
  Future<VideoModel?> GetVideoData() async {
    try {
      final res = await apiClient.getFromServer(
        endPoint: AppConstants.video,
      );

      if (res.statusCode == 200) {
        // print('notifcationoff');
        print("data");
        print(res.body);
        final listofvideodata = videoModelFromJson(res.body);
        return listofvideodata;
      } else {
        throw Exception("No data field found in the Video data");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  ////Get Products By Search Key
  Future<EbookModel> GetProductsBySearchKey(String key) async {
    try {
      final res = await apiClient.getFromServer(
        endPoint: "${AppConstants.ebooksearch}$key",
      );
      print(res.body);

      if (res.statusCode == 200) {
        print("this is search" + key.toString());
        print(res.statusCode);
        print(res.toString());
        print(res.body);
        final listofproductserachbykey = ebookModelFromJson(res.body);
        return listofproductserachbykey;
      } else {
        throw Exception("No data field found in the GeEbookkey");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  ////Get Products By Search Key
  Future<VideoModel> GetVideoSearcKey(String key) async {
    try {
      final res = await apiClient.getFromServer(
        endPoint: "${AppConstants.videosearch}$key",
      );
      print(res.body);

      if (res.statusCode == 200) {
        print("this is search" + key.toString());

        print(res.body);
        final listofvideosearchkey = videoModelFromJson(res.body);
        return listofvideosearchkey;
      } else {
        throw Exception("No data field found in the VideoSearchKey");
      }
    } catch (e) {
      throw Exception(e);
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

///////delete ebook
  Future deleteEbook({
    required String id,
  }) async {
    try {
      final response = await apiClient.postToServer(
        endPoint: "${AppConstants.admindeleteebook}$id",
        data: {},
      );
      if (response.statusCode == 200) {
        final message = jsonDecode(response.body)['message'];
        customSuccessSnackBar(message);
      } else {
        final message = jsonDecode(response.body)['message'];
        customErrorSnackBar(message);
      }
    } catch (e) {
      print("Delete EBook:$e");
      customErrorSnackBar(
          'An unexpected error occurred. Please try again later.');
    }
  }

///////delete evideoa
  Future deleteVideo({
    required String id,
  }) async {
    try {
      final response = await apiClient.postToServer(
        endPoint: "${AppConstants.admindeletevideo}$id",
        data: {},
      );
      if (response.statusCode == 200) {
        final message = jsonDecode(response.body)['message'];
        customSuccessSnackBar(message);
      } else {
        final message = jsonDecode(response.body)['message'];
        customErrorSnackBar(message);
      }
    } catch (e) {
      print("Delete EBook:$e");
      customErrorSnackBar(
          'An unexpected error occurred. Please try again later.');
    }
  }

///////admin add consultants
  Future addConsultants({
    required String name,
    required String email,
    required String password,
    required String phonenumber,
    required String hospitalname,
    required String licensenumber,
    required String experience,
    required String address,
    required String specialization,
  }) async {
    final userData = {
      "name": name,
      "email": email,
      "password": password,
      "phone_number": phonenumber,
      "hospital_name": hospitalname,
      "license_number": licensenumber,
      "experience": experience,
      "address": address,
      "specialization": specialization,
    };
    try {
      final response = await apiClient.postToServer(
        endPoint: AppConstants.adminaddconsultants,
        data: userData,
      );
      if (response.statusCode == 200) {
        Get.back();
        final message = jsonDecode(response.body)['message'];
        customSuccessSnackBar(message);
      } else {
        final message = jsonDecode(response.body)['message'];
        customErrorSnackBar(message);
      }
    } catch (e) {
      print("Add Consultants:$e");
      customErrorSnackBar(
          'An unexpected error occurred. Please try again later.');
    }
  }

//////GET ADMIN CASE DETAIL BY ID
  Future<AdminGetCaseByIdModel?> getAdminCaseById(String id) async {
    try {
      final res = await apiClient.getFromServer(
        endPoint: "${AppConstants.admingetcasebyid}$id",
      );

      if (res.statusCode == 200) {
        final listofadmincasebyid = adminGetCaseByIdFromJson(res.body);
        return listofadmincasebyid;
      } else {
        throw Exception("No data field found in the admin case by id");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

///////admin assigned case to doctor
  Future adminAssignCase({
    required String caseid,
    required String doctorid,
  }) async {
    final userData = {
      "doctor_id": doctorid.toString(),
    };
    try {
      final response = await apiClient.postToServer(
        endPoint: "${AppConstants.adminassigncase}$caseid",
        data: userData,
      );
      if (response.statusCode == 200) {
        Get.offAllNamed(RouteConstants.adminhomescreen);
        final message = jsonDecode(response.body)['message'];
        customSuccessSnackBar(message);
      } else {
        final message = jsonDecode(response.body)['message'];
        customErrorSnackBar(message);
      }
    } catch (e) {
      print("Admin Assign Case :$e");
      customErrorSnackBar(
          'An unexpected error occurred. Please try again later.');
    }
  }
}

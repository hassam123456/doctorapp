import 'dart:convert';
import 'dart:io';
import 'package:doctorapp/constants/routeconstants.dart';
import 'package:http/http.dart' as http;
import 'package:doctorapp/components/customSnackBar.dart';
import 'package:doctorapp/constants/api_service.dart';
import 'package:doctorapp/constants/appconstant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepo extends GetxService {
  HttpApiClient apiClient;
  UserRepo({required this.apiClient});

///////////upload Case
  Future<void> uploadCase({
    required String title,
    required String name,
    required String age,
    required String history,
    required String description,
    required List<File> prescriptions,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              '${AppConstants.apibaseurl}${AppConstants.useruploadCase}'));
      request.fields.addAll({
        'title': title,
        'name': name,
        'age': age,
        'history': history,
        'description': description,
      });
      for (var prescription in prescriptions) {
        request.files.add(await http.MultipartFile.fromPath(
          'prescription[]',
          prescription.path,
        ));
      }
      request.headers['Authorization'] = 'Bearer $token';
      var response = await request.send();
      final responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        final String guid = jsonDecode(responseBody)['data']['case']['guid'];
        Get.toNamed(RouteConstants.casedetails, arguments: guid.toString());
        final message = jsonDecode(responseBody)['message'];
        customSuccessSnackBar(message);
      } else {
        final message = jsonDecode(responseBody)['message'];
        customErrorSnackBar(message);
      }
    } catch (e) {
      customErrorSnackBar(
          'An unexpected error occurred. Please try again later.');
      print("Error uploading case: $e");
    }
  }

////////////upload case details
  Future uploadCaseDetails({
    required String hypertension,
    required String valvular,
    required String angina,
    required String myocardial,
    required String infective,
    required String failure,
    required String surgery,
    required String others,
    required String nausea,
    required String vomiting,
    required String peptic,
    required String gutOthers,
    required String chestPain,
    required String asthma,
    required String bronchitis,
    required String pneumonia,
    required String respOthers,
    required String tuberculosis,
    required String tuberOthers,
    required String hepatitis,
    required String anemia,
    required String bleedingDisorder,
    required String clothingDisorder,
    required String leukemia,
    required String circulatoryOthers,
    required String uti,
    required String kidneyFailure,
    required String urinaryOthers,
    required String seizure,
    required String epilepsy,
    required String nervousOthers,
    required String diabetes,
    required String hyperparathyroidism,
    required String hyperthyroidism,
    required String hyperthyroidismNew,
    required String endocrineOthers,
    required String guid,
  }) async {
    final userData = {
      "hypertension": hypertension,
      "valvular": valvular,
      "angina": angina,
      "myocardial": myocardial,
      "infective": infective,
      "failure": failure,
      "surgery": surgery,
      "others": others,
      "nausea": nausea,
      "vomiting": vomiting,
      "peptic": peptic,
      "gut_others": gutOthers,
      "chest_pain": chestPain,
      "asthma": asthma,
      "bronchitis": bronchitis,
      "pneumonia": pneumonia,
      "resp_others": respOthers,
      "tuberculosis": tuberculosis,
      "tuber_others": tuberOthers,
      "hepatitis": hepatitis,
      "anemia": anemia,
      "bleeding_disorder": bleedingDisorder,
      "clothing_disorder": clothingDisorder,
      "leukemia": leukemia,
      "circulatory_others": circulatoryOthers,
      "uti": uti,
      "kidney_failure": kidneyFailure,
      "urinary_others": urinaryOthers,
      "seizure": seizure,
      "epilepsy": epilepsy,
      "nervous_others": nervousOthers,
      "diabetes": diabetes,
      "hyperparathyroidism": hyperparathyroidism,
      "hyperthyroidism": hyperthyroidism,
      "hyperthyroidism_new": hyperthyroidismNew,
      "endocrine_others": endocrineOthers,
    };
    try {
      final response = await apiClient.postToServer(
        endPoint: "${AppConstants.useruploadcasedetails}$guid",
        data: userData,
      );
      if (response.statusCode == 200) {
        Get.offAllNamed(RouteConstants.userbottomnavbar);
        final message = jsonDecode(response.body)['message'];
        customSuccessSnackBar(message);
      } else {
        final message = jsonDecode(response.body)['message'];
        customErrorSnackBar(message);
      }
    } catch (e) {
      print("Upload Case Details:$e");
      customErrorSnackBar(
          'An unexpected error occurred. Please try again later.');
    }
  }
}

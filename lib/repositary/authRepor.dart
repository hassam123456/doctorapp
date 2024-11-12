import 'package:doctorapp/constants/api_service.dart';
import 'package:get/get.dart';

class AuthRepo extends GetxService {
  HttpApiClient apiClient;
  AuthRepo({required this.apiClient});
}

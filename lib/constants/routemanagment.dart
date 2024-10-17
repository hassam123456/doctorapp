import 'package:doctorapp/constants/routeconstants.dart';
import 'package:doctorapp/views/casedetails_screen.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage> getpages() {
    return [
      GetPage(name: RouteConstants.casedetails, page: () => CaseDetailsScreen())
    ];
  }
}

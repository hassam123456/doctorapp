import 'package:get/get.dart';

class ComponentsController extends GetxController {
/////////casedetail screen
  final RxString casedetailradiobutton = ''.obs;
  updatecasedetailradiobutton(String value) {
    casedetailradiobutton.value = value;
  }
}

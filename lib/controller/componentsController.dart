import 'package:get/get.dart';

class ComponentsController extends GetxController {
/////////casedetail screen
  final RxString casedetailradiobutton = ''.obs;
  updatecasedetailradiobutton(String value) {
    casedetailradiobutton.value = value;
  }

/////////casedetail screen
  final Map<String, RxString> radioGroupSelections = {
    'Hypertension': ''.obs,
    'Valvular': ''.obs,
    'Angina': ''.obs,
    'Myocardial': ''.obs,
    'Infective': ''.obs,
    'Cardiac': ''.obs,
    'Surgery': ''.obs,
    'Nausea': ''.obs,
    'Vomiting': ''.obs,
    'Peptic': ''.obs,
    'ChestPain': ''.obs,
    'Asthma': ''.obs,
    'Bronchitis': ''.obs,
    'Pneumonia': ''.obs,
    'Tuberculossis': ''.obs,
    'Hepatitis': ''.obs,
    'Anemia': ''.obs,
    'BleedingDisorder': ''.obs,
    'ClothingDisorder': ''.obs,
    'Leukemia': ''.obs,
    'U.T.I': ''.obs,
    'KenalFailure': ''.obs,
    'Diabetes': ''.obs,
    'Hyperparathyroidism': ''.obs,
    'Hypothyroidism': ''.obs,
    'Hyperthyroidism': ''.obs,
    'Seizure': ''.obs,
    'Epilepsy': ''.obs,
  };

  void updateRadioButton(String group, String value) {
    if (radioGroupSelections.containsKey(group)) {
      radioGroupSelections[group]?.value = value;
    }
  }

/////////////////addconsultant screen
  final RxBool addconsultantpasssword = false.obs;
  final RxBool addconsultantconfpasssword = false.obs;
  updateaddconsultantpasssword() {
    addconsultantpasssword.value = !addconsultantpasssword.value;
  }

  updateaddconsultantconfpasssword() {
    addconsultantconfpasssword.value = !addconsultantconfpasssword.value;
  }
}

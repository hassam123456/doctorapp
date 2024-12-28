import 'package:get/get.dart';

class ComponentsController extends GetxController {
/////////casedetail screen
  final RxString casedetailradiobutton = ''.obs;
  updatecasedetailradiobutton(String value) {
    casedetailradiobutton.value = value;
  }

/////////casedetail screen
  final Map<String, RxString> radioGroupSelections = {
    'Hypertension': '0'.obs,
    'Valvular': '0'.obs,
    'Angina': '0'.obs,
    'Myocardial': '0'.obs,
    'Infective': '0'.obs,
    'Cardiac': '0'.obs,
    'Surgery': '0'.obs,
    'Nausea': '0'.obs,
    'Vomiting': '0'.obs,
    'Peptic': '0'.obs,
    'ChestPain': '0'.obs,
    'Asthma': '0'.obs,
    'Bronchitis': '0'.obs,
    'Pneumonia': '0'.obs,
    'Tuberculossis': '0'.obs,
    'Hepatitis': '0'.obs,
    'Anemia': '0'.obs,
    'BleedingDisorder': '0'.obs,
    'ClothingDisorder': '0'.obs,
    'Leukemia': '0'.obs,
    'U.T.I': '0'.obs,
    'KenalFailure': '0'.obs,
    'Diabetes': '0'.obs,
    'Hyperparathyroidism': '0'.obs,
    'Hypothyroidism': '0'.obs,
    'Hyperthyroidism': '0'.obs,
    'Seizure': '0'.obs,
    'Epilepsy': '0'.obs,
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

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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

////////////upload user case screen
  var uploadUserCasePrescriptions = <File>[].obs;

  Future<void> pickUserCasePrescriptions(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Image Source"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text("Gallery"),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.gallery);
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  child: const Text("Camera"),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );

    if (pickedImage != null) {
      final pickedFile = await picker.pickImage(source: pickedImage);
      if (pickedFile != null) {
        uploadUserCasePrescriptions.add(File(pickedFile.path));
      }
    }
  }

///////////////admin upload e book screen
  var adminuploadebookimage = Rx<File?>(null);

  Future<void> pickadminuploadebookimage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Image Source"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text("Gallery"),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.gallery);
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  child: const Text("Camera"),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );

    if (pickedImage != null) {
      final pickedFile = await picker.pickImage(source: pickedImage);
      if (pickedFile != null) {
        adminuploadebookimage.value = File(pickedFile.path);
      }
    }
  }
}

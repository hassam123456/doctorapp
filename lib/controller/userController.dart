import 'dart:io';

import 'package:doctorapp/repositary/userRepo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

class UserController extends GetxController {
  UserRepo userRepo;
  UserController({required this.userRepo});

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

    if (pickedImage == null) return;

    final pickedFile = await picker.pickImage(source: pickedImage);
    if (pickedFile == null) return;

    File imageFile = File(pickedFile.path);
    if (pickedImage == ImageSource.camera) {
      img.Image? image = img.decodeImage(imageFile.readAsBytesSync());
      if (image != null) {
        imageFile = File(pickedFile.path)
          ..writeAsBytesSync(
              img.encodeJpg(img.copyResize(image, width: 800, height: 600)));
      }
    }
    uploadUserCasePrescriptions.add(imageFile);
  }

/////////////////user upload case
  final useruploadCaseTitlecontroller = TextEditingController().obs;
  final useruploadPatientNamecontroller = TextEditingController().obs;
  final useruploadPatientAgecontroller = TextEditingController().obs;
  final useruploaddescriptioncontroller = TextEditingController().obs;
  final useruploadmedicalHistorycontroller = TextEditingController().obs;
  final RxBool useruploadcaseloading = false.obs;
  Future<void> userUploadCase() async {
    try {
      useruploadcaseloading.value = true;
      await userRepo.uploadCase(
          title: useruploadCaseTitlecontroller.value.text.toString(),
          name: useruploadPatientNamecontroller.value.text.toString(),
          age: useruploadPatientAgecontroller.value.text.toString(),
          history: useruploadmedicalHistorycontroller.value.text.toString(),
          description: useruploaddescriptioncontroller.value.text.toString(),
          prescriptions: uploadUserCasePrescriptions);

      useruploadcaseloading.value = false;
    } finally {
      useruploadcaseloading.value = false;
    }
  }

/////////////upload case details
////CVS
  final RxString uploadcasedetailshypertension = ''.obs;
  final RxString uploadcasedetailsvalvular = ''.obs;
  final RxString uploadcasedetailsangina = ''.obs;
  final RxString uploadcasedetailsmyocardial = ''.obs;
  final RxString uploadcasedetailsinfective = ''.obs;
  final RxString uploadcasedetailsfailure = ''.obs;
  final RxString uploadcasedetailssurgery = ''.obs;
  final uploadcasedetailscvsother = TextEditingController().obs;

  ///GIT
  final RxString uploadcasedetailsnausea = ''.obs;
  final RxString uploadcasedetailsvomiting = ''.obs;
  final RxString uploadcasedetailspeptic = ''.obs;
  final uploadcasedetailsgitother = TextEditingController().obs;
////Respiratory
  final RxString uploadcasedetailschestpain = ''.obs;
  final RxString uploadcasedetailsasthma = ''.obs;
  final RxString uploadcasedetailsbronchitis = ''.obs;
  final RxString uploadcasedetailspneumonia = ''.obs;
  final uploadcasedetailsrespiratoryother = TextEditingController().obs;
////tuberculossis
  final RxString uploadcasedetailstuberculossis = ''.obs;
  final uploadcasedetailstuberculossisother = TextEditingController().obs;
////hepatitis
  final RxString uploadcasedetailshepatitis = ''.obs;
  final uploadcasedetailshepatitisother = TextEditingController().obs;
  ////circulatory
  final RxString uploadcasedetailsanemia = ''.obs;
  final RxString uploadcasedetailsbleedingdisorder = ''.obs;
  final RxString uploadcasedetailsclothingdisorder = ''.obs;
  final RxString uploadcasedetailsleukemia = ''.obs;
  final uploadcasedetailcirculatoryother = TextEditingController().obs;
////urinary
  final RxString uploadcasedetailsuti = ''.obs;
  final RxString uploadcasedetailskenalfailure = ''.obs;
  final uploadcasedetailsurinaryother = TextEditingController().obs;
  ////endocrine
  final RxString uploadcasedetailsdiabetes = ''.obs;
  final RxString uploadcasedetailshyperparathyrodism = ''.obs;
  final RxString uploadcasedetailshypothyroidism = ''.obs;
  final RxString uploadcasedetailshyperthyrodism = ''.obs;
  final uploadcasedetailsendocrineother = TextEditingController().obs;

  ////nervous
  final RxString uploadcasedetailsseizure = ''.obs;
  final RxString uploadcasedetailsepilepsy = ''.obs;
  final uploadcasedetailsnervousother = TextEditingController().obs;

  final RxBool useruploadcasedetailsloading = false.obs;
  Future<void> userUploadCaseDetails({required String guid}) async {
    try {
      useruploadcasedetailsloading.value = true;
      await userRepo.uploadCaseDetails(
        guid: guid,
        hypertension: uploadcasedetailshypertension.value.toString(),
        valvular: uploadcasedetailsvalvular.value.toString(),
        angina: uploadcasedetailsangina.value.toString(),
        myocardial: uploadcasedetailsmyocardial.value.toString(),
        infective: uploadcasedetailsinfective.value.toString(),
        failure: uploadcasedetailsfailure.value.toString(),
        surgery: uploadcasedetailssurgery.value.toString(),
        others: uploadcasedetailscvsother.value.text.toString(),
        nausea: uploadcasedetailsnausea.value.toString(),
        vomiting: uploadcasedetailsvomiting.value.toString(),
        peptic: uploadcasedetailspeptic.value.toString(),
        gutOthers: uploadcasedetailsgitother.value.text.toString(),
        chestPain: uploadcasedetailschestpain.value.toString(),
        asthma: uploadcasedetailsasthma.value.toString(),
        bronchitis: uploadcasedetailsbronchitis.value.toString(),
        pneumonia: uploadcasedetailspneumonia.value.toString(),
        respOthers: uploadcasedetailsrespiratoryother.value.text.toString(),
        tuberculosis: uploadcasedetailstuberculossis.value.toString(),
        tuberOthers: uploadcasedetailstuberculossisother.value.text.toString(),
        hepatitis: uploadcasedetailshepatitis.value.toString(),
        hepatitisother: uploadcasedetailshepatitisother.value.text.toString(),
        anemia: uploadcasedetailsanemia.value.toString(),
        bleedingDisorder: uploadcasedetailsbleedingdisorder.value.toString(),
        clothingDisorder: uploadcasedetailsclothingdisorder.value.toString(),
        leukemia: uploadcasedetailsleukemia.value.toString(),
        circulatoryOthers:
            uploadcasedetailcirculatoryother.value.text.toString(),
        uti: uploadcasedetailsuti.value.toString(),
        kidneyFailure: uploadcasedetailskenalfailure.value.toString(),
        urinaryOthers: uploadcasedetailsurinaryother.value.text.toString(),
        seizure: uploadcasedetailsseizure.value.toString(),
        epilepsy: uploadcasedetailsepilepsy.value.toString(),
        nervousOthers: uploadcasedetailsnervousother.value.text.toString(),
        diabetes: uploadcasedetailsdiabetes.value.toString(),
        hyperparathyroidism:
            uploadcasedetailshyperparathyrodism.value.toString(),
        hyperthyroidism: uploadcasedetailshyperthyrodism.value.toString(),
        hyperthyroidismNew: uploadcasedetailshypothyroidism.value.toString(),
        endocrineOthers: uploadcasedetailsendocrineother.value.text.toString(),
      );

      useruploadcasedetailsloading.value = false;
    } finally {
      useruploadcasedetailsloading.value = false;
    }
  }
}

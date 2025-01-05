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

    List<XFile> pickedFiles = pickedImage == ImageSource.gallery
        ? await picker.pickMultiImage(imageQuality: 80)
        : [await picker.pickImage(source: ImageSource.camera, imageQuality: 80)]
            .whereType<XFile>()
            .toList();

    if (pickedFiles.isEmpty) return;

    for (var pickedFile in pickedFiles) {
      File imageFile = File(pickedFile.path);
      if (pickedImage == ImageSource.camera) {
        img.Image? image = img.decodeImage(imageFile.readAsBytesSync());
        if (image != null) {
          imageFile = imageFile
            ..writeAsBytesSync(
                img.encodeJpg(img.copyResize(image, width: 800, height: 600)));
        }
      }
      uploadUserCasePrescriptions.add(imageFile);
    }
  }

/////////////////user upload case
  final useruploadCaseTitlecontroller = TextEditingController().obs;
  final useruploadPatientNamecontroller = TextEditingController().obs;
  final useruploadPatientAgecontroller = TextEditingController().obs;
  final useruploadPatientgendercontroller = TextEditingController().obs;
  final useruploaddescriptioncontroller = TextEditingController().obs;
  final useruploadmedicalHistorycontroller = TextEditingController().obs;

  final RxBool useruploadcaseloading = false.obs;
  Future<void> userUploadCase() async {
    try {
      useruploadcaseloading.value = true;
      await userRepo.uploadCase(
          gender: useruploadPatientgendercontroller.value.text.toString(),
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
  final RxString uploadcasedetailshypertension = '0'.obs;
  final RxString uploadcasedetailsvalvular = '0'.obs;
  final RxString uploadcasedetailsangina = '0'.obs;
  final RxString uploadcasedetailsmyocardial = '0'.obs;
  final RxString uploadcasedetailsinfective = '0'.obs;
  final RxString uploadcasedetailsfailure = '0'.obs;
  final RxString uploadcasedetailssurgery = '0'.obs;
  final uploadcasedetailscvsother = TextEditingController().obs;

  ///GIT
  final RxString uploadcasedetailsnausea = '0'.obs;
  final RxString uploadcasedetailsvomiting = '0'.obs;
  final RxString uploadcasedetailspeptic = '0'.obs;
  final uploadcasedetailsgitother = TextEditingController().obs;
////Respiratory
  final RxString uploadcasedetailschestpain = '0'.obs;
  final RxString uploadcasedetailsasthma = '0'.obs;
  final RxString uploadcasedetailsbronchitis = '0'.obs;
  final RxString uploadcasedetailspneumonia = '0'.obs;
  final uploadcasedetailsrespiratoryother = TextEditingController().obs;
////tuberculossis
  final RxString uploadcasedetailstuberculossis = '0'.obs;
  final uploadcasedetailstuberculossisother = TextEditingController().obs;
////hepatitis
  final RxString uploadcasedetailshepatitis = '0'.obs;
  final uploadcasedetailshepatitisother = TextEditingController().obs;
  ////circulatory
  final RxString uploadcasedetailsanemia = '0'.obs;
  final RxString uploadcasedetailsbleedingdisorder = '0'.obs;
  final RxString uploadcasedetailsclothingdisorder = '0'.obs;
  final RxString uploadcasedetailsleukemia = '0'.obs;
  final uploadcasedetailcirculatoryother = TextEditingController().obs;
////urinary
  final RxString uploadcasedetailsuti = '0'.obs;
  final RxString uploadcasedetailskenalfailure = '0'.obs;
  final uploadcasedetailsurinaryother = TextEditingController().obs;
  ////endocrine
  final RxString uploadcasedetailsdiabetes = '0'.obs;
  final RxString uploadcasedetailshyperparathyrodism = '0'.obs;
  final RxString uploadcasedetailshypothyroidism = '0'.obs;
  final RxString uploadcasedetailshyperthyrodism = '0'.obs;
  final uploadcasedetailsendocrineother = TextEditingController().obs;

  ////nervous
  final RxString uploadcasedetailsseizure = '0'.obs;
  final RxString uploadcasedetailsepilepsy = '0'.obs;
  final uploadcasedetailsnervousother = TextEditingController().obs;

  final uploadcasedetailsdrughistory = TextEditingController().obs;
  final RxBool useruploadcasedetailsloading = false.obs;
  Future<void> userUploadCaseDetails({required String guid}) async {
    try {
      useruploadcasedetailsloading.value = true;
      await userRepo.uploadCaseDetails(
        guid: guid,
        drughistory: uploadcasedetailsdrughistory.value.text.toString(),
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

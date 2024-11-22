import 'dart:io';

import 'package:doctorapp/repositary/adminRepo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AdminController extends GetxController {
  AdminRepo adminRepo;
  AdminController({required this.adminRepo});

////////////create e book
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
        adminuploadebookimage.value = pickedImage == ImageSource.camera
            ? await resizeImage(File(pickedFile.path))
            : File(pickedFile.path);
      }
    }
  }

  final ebooktitlecontroller = TextEditingController().obs;
  final ebookcategorycontroller = TextEditingController().obs;
  final ebookurlcontroller = TextEditingController().obs;
  final ebookdescriptioncontroller = TextEditingController().obs;
  final RxBool createebookloading = false.obs;
  Future<void> createEbook() async {
    try {
      createebookloading.value = true;
      await adminRepo.creatEBook(
          ebookfile: adminuploadebookimage.value!,
          title: ebooktitlecontroller.value.text.toString(),
          category: ebookcategorycontroller.value.text.toString(),
          url: ebookurlcontroller.value.text.toString(),
          description: ebookdescriptioncontroller.value.text.toString());

      createebookloading.value = false;
    } finally {
      createebookloading.value = false;
    }
  }

// get ebook section
  final Rx<EbookModel?> ebookdata = Rx<EbookModel?>(null);
  final RxBool ebookloading = false.obs;
  getebookdata() async {
    try {
      ebookloading(true);
      await adminRepo.GetEbookdata().then((value) {
        ebookdata.value = value;
        ebookloading(false);
      });
    } catch (e) {
      ebookloading(false);
    }
  }

  final Rx<EbookModel?> productbyserachkey = Rx<EbookModel?>(null);
  final ebooksearchcontroller = TextEditingController().obs;
  var productbyserachkeyloading = false.obs;
  getproductssearchbykey(String key) async {
    print(key);
    try {
      if (key.isEmpty) {
        productbyserachkey.value = null;
        return;
      }
      productbyserachkeyloading(true);
      await adminRepo.GetProductsBySearchKey(key).then((value) {
        productbyserachkey.value = value; // Update the data
      });
    } catch (e) {
      productbyserachkeyloading(false);
      showErrrorSnackbar(message: "Error: $e");
    } finally {
      productbyserachkeyloading(false);
    }
  }

// get video section
  final Rx<VideoModel?> videodata = Rx<VideoModel?>(null);
  final RxBool videloading = false.obs;
  getvideodata() async {
    try {
      ebookloading(true);
      await adminRepo.GetVideoData().then((value) {
        videodata.value = value;
        videloading(false);
      });
    } catch (e) {
      ebookloading(false);
    }
  }

  final Rx<VideoModel?> videosearchkey = Rx<VideoModel?>(null);
  final videosearchcontroller = TextEditingController().obs;
  var videobyserachkeyloading = false.obs;
  getvideosearchkey(String key) async {
    print(key);
    try {
      if (key.isEmpty) {
        videosearchkey.value = null;
        return;
      }
      videobyserachkeyloading(true);
      await adminRepo.GetVideoSearcKey(key).then((value) {
        videosearchkey.value = value; // Update the data
      });
    } catch (e) {
      videobyserachkeyloading(false);
      showErrrorSnackbar(message: "Error: $e");
    } finally {
      videobyserachkeyloading(false);
    }
  }

////////admin create video
  var adminuploadvideoimage = Rx<File?>(null);

  Future<void> pickadminuploadvideoimage(BuildContext context) async {
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
        adminuploadvideoimage.value = pickedImage == ImageSource.camera
            ? await resizeImage(File(pickedFile.path))
            : File(pickedFile.path);
      }
    }
  }

  final videotitlecontroller = TextEditingController().obs;
  final videocategorycontroller = TextEditingController().obs;
  final videourlcontroller = TextEditingController().obs;
  final videodescriptioncontroller = TextEditingController().obs;
  final RxBool createvideoloading = false.obs;
  Future<void> createVideo() async {
    try {
      createvideoloading.value = true;
      await adminRepo.creatVideo(
          videoFile: adminuploadvideoimage.value!,
          title: videotitlecontroller.value.text.toString(),
          category: videocategorycontroller.value.text.toString(),
          url: videourlcontroller.value.text.toString(),
          description: videodescriptioncontroller.value.text.toString());

      createvideoloading.value = false;
    } finally {
      createvideoloading.value = false;
    }
  }

/////////////////add consultants
  final adminaddconsultantnamecontroller = TextEditingController().obs;
  final adminaddconsultantemailcontroller = TextEditingController().obs;
  final adminaddconsultanthospitalnamecontroller = TextEditingController().obs;
  final adminaddconsultantphonenumbercontroller = TextEditingController().obs;
  final adminaddconsultantaddresscontroller = TextEditingController().obs;
  final adminaddconsultantlicensecontroller = TextEditingController().obs;
  final adminaddconsultantspecializationcontroller =
      TextEditingController().obs;
  final adminaddconsultantexperiencecontroller = TextEditingController().obs;
  final adminaddconsultantpasswordcontroller = TextEditingController().obs;
  final adminaddconsultantconfirmpasswordcontroller =
      TextEditingController().obs;

  final RxBool addconsultantsloading = false.obs;
  Future<void> addConsulant() async {
    try {
      addconsultantsloading.value = true;
      await adminRepo.addConsultants(
        name: adminaddconsultantnamecontroller.value.text.toString(),
        email: adminaddconsultantemailcontroller.value.text.toString(),
        password:
            adminaddconsultantconfirmpasswordcontroller.value.text.toString(),
        phonenumber:
            adminaddconsultantphonenumbercontroller.value.text.toString(),
        hospitalname:
            adminaddconsultanthospitalnamecontroller.value.text.toString(),
        licensenumber:
            adminaddconsultantlicensecontroller.value.text.toString(),
        experience:
            adminaddconsultantexperiencecontroller.value.text.toString(),
        address: adminaddconsultantaddresscontroller.value.text.toString(),
        specialization:
            adminaddconsultantspecializationcontroller.value.text.toString(),
      );

      addconsultantsloading.value = false;
    } finally {
      addconsultantsloading.value = false;
    }
  }
}

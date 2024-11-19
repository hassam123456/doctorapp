import 'dart:io';

import 'package:doctorapp/repositary/adminRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        adminuploadebookimage.value = File(pickedFile.path);
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
          image: adminuploadebookimage.value!,
          title: ebooktitlecontroller.value.text.toString(),
          category: ebookcategorycontroller.value.text.toString(),
          url: ebookurlcontroller.value.text.toString(),
          description: ebookdescriptioncontroller.value.text.toString());

      createebookloading.value = false;
    } finally {
      createebookloading.value = false;
    }
  }

////////admin create video
  final videotitlecontroller = TextEditingController().obs;
  final videocategorycontroller = TextEditingController().obs;
  final videourlcontroller = TextEditingController().obs;
  final videodescriptioncontroller = TextEditingController().obs;
  final RxBool createvideoloading = false.obs;
  Future<void> createVideo() async {
    try {
      createvideoloading.value = true;
      await adminRepo.creatVideo(
          title: videotitlecontroller.value.text.toString(),
          category: videocategorycontroller.value.text.toString(),
          url: videourlcontroller.value.text.toString(),
          description: videodescriptioncontroller.value.text.toString());

      createvideoloading.value = false;
    } finally {
      createvideoloading.value = false;
    }
  }
}

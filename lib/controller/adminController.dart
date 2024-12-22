import 'dart:ffi';
import 'dart:io';

import 'package:doctorapp/components/errordailog.dart';
import 'package:doctorapp/components/resizeImage.dart';
import 'package:doctorapp/model/adminconsultantmodel.dart';
import 'package:doctorapp/model/admingetcaseByIdModel.dart';
import 'package:doctorapp/model/consultantlistmodel.dart';
import 'package:doctorapp/model/ebookmodel.dart';
import 'package:doctorapp/model/notificationmodel.dart';
import 'package:doctorapp/model/profilemodel.dart';
import 'package:doctorapp/model/videomodel.dart';
import 'package:doctorapp/repositary/adminRepo.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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

//   final RxBool updateSellerProfileDataloading = false.obs;
// final Rx<ProfileModel?> getsellerprofiledata =
//       Rx<ProfileModel?>(null);
//   final RxBool getsellerprofiledataloading = false.obs;
//   Future<void> updateSellerProfileData({
//     required BuildContext context,
//     required String address,
//     required String city,
//     required String state,
//     required String country,
//     required String zipcode,
//     // required int orangepay,
//   }) async {
//     try {
//       updateSellerProfileDataloading.value = true;
//       await
//           .updatesellerprofiledata(
//               context: context,
//               orangepay: updateorangenumber.value.text.isEmpty
//                   ? getsellerprofiledata.value?.data?.orangepay.toString() ?? ""
//                   : updateorangenumber.value.text.toString(),
//               phonecountrycode:
//                   updatesellerprofilephonecountrycode.value.isEmpty
//                       ? getsellerprofiledata.value?.data?.phonecountrycode
//                               .toString() ??
//                           ""
//                       : updatesellerprofilephonecountrycode.value.toString(),
//               name: updatesellerprofilename.value.text.isEmpty
//                   ? getsellerprofiledata.value?.data?.name.toString() ?? ""
//                   : updatesellerprofilename.value.text.toString(),
//               address: address.isEmpty
//                   ? getsellerprofiledata.value?.data?.address.toString() ?? ""
//                   : address,
//               city: city.isEmpty
//                   ? getsellerprofiledata.value?.data?.city.toString() ?? ""
//                   : city,
//               state: state.isEmpty
//                   ? getsellerprofiledata.value?.data?.state.toString() ?? ""
//                   : state,
//               country: country.isEmpty
//                   ? getsellerprofiledata.value?.data?.country.toString() ?? ""
//                   : country,
//               zipcode: zipcode.isEmpty
//                   ? getsellerprofiledata.value?.data?.zipCode.toString() ?? ""
//                   : zipcode,
//               phonecode: updatesellerprofilephonecode.value.isEmpty
//                   ? getsellerprofiledata.value?.data?.phoneCode.toString() ?? ""
//                   : updatesellerprofilephonecode.value.toString(),
//               phonenumber: updatesellerprofilephonenumber.value.text.isEmpty
//                   ? getsellerprofiledata.value?.data?.phoneNumber.toString() ??
//                       ""
//                   : updatesellerprofilephonenumber.value.text.toString(),
//               profileimage: sellershopuploadedprofileImage.value)
//           .then((value) => getsellerprofiledata());

//       updateSellerProfileDataloading.value = false;
//     } finally {
//       updateSellerProfileDataloading.value = false;
//     }
//   }

  var sellershopuploadedprofileImage = Rx<File?>(null);
  final updatesellerprofilephonenumber = TextEditingController().obs;
  final updatesellerprofilename = TextEditingController().obs;
  final updateorangenumber = TextEditingController().obs;
  final updatesellerprofilephonecode = ''.obs;
  final updatesellerprofilephonecountrycode = ''.obs;
  void sellershopprofileImage(File? image) {
    sellershopuploadedprofileImage.value = image;
  }

  Future<void> uploadsellershopprofileImage(BuildContext context) async {
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
        sellershopprofileImage(File(pickedFile.path));
      }
    }
  }
  // final RxBool updateSellerProfileDataloading = false.obs;
  // final Rx<ProfileModel?> getsellerprofiledata =
  //     Rx<ProfileModel?>(null);
  // final RxBool getsellerprofiledataloading = false.obs;
  // Future<void> updateSellerProfileData({
  //   required BuildContext context,
  //   required String address,
  //   required String city,
  //   required String state,
  //   required String country,
  //   required String zipcode,
  //   // required int orangepay,
  // }) async {
  //   try {
  //     updateSellerProfileDataloading.value = true;
  //     await adminRepo
  //         .updatesellerprofiledata(
  //             context: context,

  //             phonecountrycode:
  //                 updatesellerprofilephonecountrycode.value.isEmpty
  //                     ? getsellerprofiledata.value?.data?.phonecountrycode
  //                             .toString() ??
  //                         ""
  //                     : updatesellerprofilephonecountrycode.value.toString(),
  //             name: updatesellerprofilename.value.text.isEmpty
  //                 ? getsellerprofiledata.value?.data?.name.toString() ?? ""
  //                 : updatesellerprofilename.value.text.toString(),
  //             address: address.isEmpty
  //                 ? getsellerprofiledata.value?.data?.address.toString() ?? ""
  //                 : address,
  //             city: city.isEmpty
  //                 ? getsellerprofiledata.value?.data?.city.toString() ?? ""
  //                 : city,
  //             state: state.isEmpty
  //                 ? getsellerprofiledata.value?.data?.state.toString() ?? ""
  //                 : state,
  //             country: country.isEmpty
  //                 ? getsellerprofiledata.value?.data?.country.toString() ?? ""
  //                 : country,
  //             zipcode: zipcode.isEmpty
  //                 ? getsellerprofiledata.value?.data?.zipCode.toString() ?? ""
  //                 : zipcode,
  //             phonecode: updatesellerprofilephonecode.value.isEmpty
  //                 ? getsellerprofiledata.value?.data?.phoneCode.toString() ?? ""
  //                 : updatesellerprofilephonecode.value.toString(),
  //             phonenumber: updatesellerprofilephonenumber.value.text.isEmpty
  //                 ? getsellerprofiledata.value?.data?.phoneNumber.toString() ??
  //                     ""
  //                 : updatesellerprofilephonenumber.value.text.toString(),
  //             profileimage: sellershopuploadedprofileImage.value)
  //         .then((value) => getsellerprofiledata());

  //     updateSellerProfileDataloading.value = false;
  //   } finally {
  //     updateSellerProfileDataloading.value = false;
  //   }

  // get profile data
  final Rx<ProfileModel?> getprofiledata = Rx<ProfileModel?>(null);
  final RxBool getprofiledataloading = false.obs;
  getProfileData() async {
    try {
      getprofiledataloading(true);
      await adminRepo.getProfileData().then((value) {
        getprofiledata.value = value;
        getprofiledataloading(false);
      });
    } catch (e) {
      getprofiledataloading(false);
    }
  }

  // get notification data
  final Rx<NotificationModel?> getnotificationdata =
      Rx<NotificationModel?>(null);
  final RxBool getnotificationdatloading = false.obs;
  getnotification() async {
    try {
      getnotificationdatloading(true);
      await adminRepo.getnotificationdata().then((value) {
        getnotificationdata.value = value;
        getnotificationdatloading(false);
      });
    } catch (e) {
      getnotificationdatloading(false);
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

// get ebook section
// get ebook section
  final Rx<EbookModel?> ebookdata = Rx<EbookModel?>(null);
  final RxBool ebookloading = false.obs;
  final RxBool ebookReloading = false.obs;
  final RxInt ebookdatapage = 1.obs;

  Future<void> getebookdata() async {
    if (ebookReloading.value || ebookloading.value) return;

    // Prevent further calls if we're beyond the total pages
    if (ebookdatapage.value > 1 &&
        ebookdatapage.value >
            (ebookdata.value?.data?.pagination?.totalPages ?? 0)) {
      return;
    }

    try {
      ebookdatapage.value > 1
          ? ebookReloading.value = true
          : ebookloading.value = true;

      // Fetch data from API
      final value =
          await adminRepo.GetEbookdata(page: ebookdatapage.value.toString());

      // Append or assign data based on the current page
      if (ebookdatapage.value > 1) {
        ebookdata.value?.data?.ebooks?.addAll(value?.data?.ebooks ?? []);
      } else {
        ebookdata.value = value;
      }

      // Increment page number for next fetch
      ebookdatapage.value++;
      ebookReloading.value = false;
      ebookloading.value = false;
    } catch (e) {
      ebookReloading.value = false;
      ebookloading.value = false;
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
  final RxBool videoloading = false.obs;
  final RxBool videoReloading = false.obs;
  final RxInt videodatapage = 1.obs;
  Future<void> getvideodata() async {
    if (videoReloading.value || videoloading.value) return;
    if (videodatapage.value > 1 &&
        videodatapage.value >
            (videodata.value?.data?.pagination?.totalPages ?? 0)) {
      return;
    }

    try {
      videodatapage.value > 1
          ? videoReloading.value = true
          : videoloading.value = true;
      final value =
          await adminRepo.GetVideoData(page: videodatapage.value.toString());
      if (videodatapage.value > 1) {
        videodata.value?.data?.videos?.addAll(value?.data?.videos ?? []);
      } else {
        videodata.value = value;
      }
      videodatapage.value++;
      videoReloading.value = false;
      videoloading.value = false;
    } catch (e) {
      videoReloading.value = false;
      videoloading.value = false;
    }
  }

  // get casedetails
  final Rx<AdminConsultantList?> admincaseconsult =
      Rx<AdminConsultantList?>(null);
  final RxBool admincaseconsultloading = false.obs;
  getadmincaseconsult() async {
    try {
      admincaseconsultloading(true);
      await adminRepo.GetCaseAdmin().then((value) {
        admincaseconsult.value = value;
        admincaseconsultloading(false);
      });
    } catch (e) {
      admincaseconsultloading(false);
    }
  }

  // get casedetails
  final Rx<AdminConsultantList?> usercaseconsult =
      Rx<AdminConsultantList?>(null);
  final RxBool usercaseconsultloading = false.obs;
  getusercaseconsul() async {
    try {
      usercaseconsultloading(true);
      await adminRepo.GetUserMethod().then((value) {
        usercaseconsult.value = value;
        usercaseconsultloading(false);
      });
    } catch (e) {
      usercaseconsultloading(false);
    }
  }

  // get doctorcasedetails
  final Rx<AdminConsultantList?> doctorcaseconsult =
      Rx<AdminConsultantList?>(null);
  final RxBool doctorcaseconsultloading = false.obs;
  getdoctorcaseconsul() async {
    try {
      doctorcaseconsultloading(true);
      await adminRepo.GetdoctorMethod().then((value) {
        doctorcaseconsult.value = value;
        doctorcaseconsultloading(false);
      });
    } catch (e) {
      doctorcaseconsultloading(false);
    }
  }

  // get consultant list method
  // get casedetails
// Consultant list pagination variables
  final Rx<ConsultantListModel?> consultantlist =
      Rx<ConsultantListModel?>(null);
  final RxBool consultantlistloading = false.obs;
  final RxBool consultantlistReloading = false.obs;
  final RxInt consultantlistPage = 1.obs;

// Method to fetch paginated consultant list
  Future<void> getconsultantlist() async {
    if (consultantlistReloading.value || consultantlistloading.value) return;

    // Stop if all pages have been loaded
    if (consultantlistPage.value > 1 &&
        consultantlistPage.value >
            (consultantlist.value?.data?.pagination?.totalPages ?? 0)) {
      return;
    }

    try {
      consultantlistPage.value > 1
          ? consultantlistReloading.value = true
          : consultantlistloading.value = true;

      // Fetch data from API
      final value = await adminRepo.Getconsultantlist(
          page: consultantlistPage.value.toString());

      if (consultantlistPage.value > 1) {
        // Append new data if it's not the first page
        consultantlist.value?.data?.doctors?.addAll(value?.data?.doctors ?? []);
      } else {
        // Set new data for the first page
        consultantlist.value = value;
      }

      // Increment page for next request
      consultantlistPage.value++;

      consultantlistReloading.value = false;
      consultantlistloading.value = false;
    } catch (e) {
      // Handle error and reset loading states
      consultantlistReloading.value = false;
      consultantlistloading.value = false;
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

//////admin get case detail by id
  final Rx<AdminGetCaseByIdModel?> admingetcasebyid =
      Rx<AdminGetCaseByIdModel?>(null);
  final RxBool admingetcasebyidloading = false.obs;
  getAdminCaseById(String id) async {
    try {
      admingetcasebyidloading(true);
      await adminRepo.getAdminCaseById(id).then((value) {
        admingetcasebyid.value = value;
        admingetcasebyidloading(false);
      });
    } catch (e) {
      admingetcasebyidloading(false);
    }
  }

/////////////admin assigncase
  final RxBool adminassigncaseloading = false.obs;
  Future<void> adminAssignCaseDoctor({
    required String caseid,
    required String doctorid,
  }) async {
    try {
      adminassigncaseloading.value = true;
      await adminRepo.adminAssignCase(caseid: caseid, doctorid: doctorid);

      adminassigncaseloading.value = false;
    } finally {
      adminassigncaseloading.value = false;
    }
  }

/////////////doctor upload treatment
  var doctoruploadtreatmentfiles = <File>[].obs;
  var doctoruploadtreatmentfilenames = <String?>[].obs;

  Future<void> doctorPickTreatmentfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
        allowMultiple: true);

    if (result != null && result.files.isNotEmpty) {
      for (var file in result.files) {
        String? filePath = file.path;
        if (filePath != null) {
          String fileName = filePath.split('/').last;
          doctoruploadtreatmentfiles.add(File(file.path!));
          doctoruploadtreatmentfilenames.add(fileName);
        }
      }
    } else {
      doctoruploadtreatmentfilenames.clear();
      doctoruploadtreatmentfiles.clear();
    }
  }

  final RxBool doctoruploadTreatmentloading = false.obs;
  Future<void> doctorUploadTreatment({
    required String caseguid,
  }) async {
    try {
      doctoruploadTreatmentloading.value = true;
      await adminRepo.doctorUploadTreatment(
        caseguid: caseguid,
        treatment: doctoruploadtreatmentfiles,
      );

      doctoruploadTreatmentloading.value = false;
    } finally {
      doctoruploadTreatmentloading.value = false;
    }
  }
}

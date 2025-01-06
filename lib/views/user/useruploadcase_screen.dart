import 'package:doctorapp/components/customSnackBar.dart';
import 'package:doctorapp/components/customcomponents.dart';
import 'package:doctorapp/constants/colors.dart';
import 'package:doctorapp/controller/componentsController.dart';
import 'package:doctorapp/controller/userController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserUploadCaseScreen extends StatefulWidget {
  const UserUploadCaseScreen({super.key});

  @override
  State<UserUploadCaseScreen> createState() => _UserUploadCaseScreenState();
}

class _UserUploadCaseScreenState extends State<UserUploadCaseScreen> {
  final componentcontroller = Get.put(ComponentsController());
  final usercontroller = Get.put(UserController(userRepo: Get.find()));
  final formkey = GlobalKey<FormState>();

  // Add a variable to track checkbox state
  bool isDisclaimerChecked = false;

  @override
  void initState() {
    super.initState();
    usercontroller.uploadUserCasePrescriptions.clear();
    usercontroller.useruploadCaseTitlecontroller.value.clear();
    usercontroller.useruploadPatientNamecontroller.value.clear();
    usercontroller.useruploadPatientAgecontroller.value.clear();
    usercontroller.useruploaddescriptioncontroller.value.clear();
    usercontroller.useruploadmedicalHistorycontroller.value.clear();
    usercontroller.useruploadPatientgendercontroller.value.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Case"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Row(
              children: [
                Checkbox(
                  value: isDisclaimerChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isDisclaimerChecked = value!;
                    });
                  },
                ),
                GestureDetector(
                  onTap: () {
                    // g
                  },
                  child: Text(
                    "Agree to Disclaimer",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                customtextformfield(
                    controler:
                        usercontroller.useruploadCaseTitlecontroller.value,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "Please enter title";
                      }
                      return null;
                    },
                    lable: "Case Title"),
                SizedBox(
                  height: 2.h,
                ),
                customtextformfield(
                    controler:
                        usercontroller.useruploadPatientNamecontroller.value,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "Please enter name";
                      }
                      return null;
                    },
                    lable: "Patient Name"),
                SizedBox(
                  height: 2.h,
                ),
                customnumbertextformfield(
                    controller:
                        usercontroller.useruploadPatientAgecontroller.value,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "Please enter age";
                      }
                      return null;
                    },
                    lable: "Patient Age"),
                SizedBox(
                  height: 2.h,
                ),
                customnumbertextformfield(
                    controller:
                        usercontroller.useruploadPatientgendercontroller.value,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "Please enter gender";
                      }
                      return null;
                    },
                    lable: "Gender"),
                SizedBox(
                  height: 2.h,
                ),
                TextFormField(
                  maxLength: 1000,
                  maxLines: 5,
                  controller:
                      usercontroller.useruploaddescriptioncontroller.value,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Please enter Description ";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color:
                                  const Color(0xff2E2E2E).withOpacity(0.02))),
                      labelText: "Description"),
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextFormField(
                  maxLines: 5,
                  controller:
                      usercontroller.useruploadmedicalHistorycontroller.value,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Please enter medical history";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color:
                                  const Color(0xff2E2E2E).withOpacity(0.02))),
                      labelText: "Clinical Finding"),
                ),
                SizedBox(
                  height: 2.h,
                ),
                GestureDetector(
                  onTap: () {
                    usercontroller.pickUserCasePrescriptions(context);
                  },
                  child: Container(
                    height: 5.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff34A853)),
                        color: Color(0xff34A853).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_upload_outlined,
                          size: 22.sp,
                          color: const Color(0xff34A853),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          "Upload X/Ray Investigation",
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Obx(
                  () => usercontroller.uploadUserCasePrescriptions.isEmpty
                      ? const SizedBox()
                      : SizedBox(
                          height: 18.h,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: usercontroller
                                        .uploadUserCasePrescriptions.length,
                                    itemBuilder: (context, index) {
                                      final prescimage = usercontroller
                                          .uploadUserCasePrescriptions[index];
                                      return Padding(
                                        padding: EdgeInsets.only(right: 4.w),
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Container(
                                              height: 15.h,
                                              width: 40.w,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black)),
                                              child: Image.file(
                                                prescimage,
                                                height: 15.h,
                                                width: 40.w,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Positioned(
                                                right: -2.w,
                                                top: -0 / 5.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    usercontroller
                                                        .uploadUserCasePrescriptions
                                                        .removeAt(index);
                                                  },
                                                  child: CircleAvatar(
                                                    radius: 16.sp,
                                                    backgroundColor: mainColor,
                                                    child: Icon(
                                                      Icons.clear,
                                                      color: Colors.white,
                                                      size: 17.sp,
                                                    ),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      );
                                    })
                              ],
                            ),
                          )),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Obx(
                  () => usercontroller.useruploadcaseloading.value
                      ? Center(
                          child: customcircularProgress(),
                        )
                      : custombutton(
                          title: "Next",
                          ontap: () {
                            if (formkey.currentState!.validate()) {
                              if (!isDisclaimerChecked) {
                                customErrorSnackBar(
                                    "Please agree to the disclaimer.");
                              } else if (usercontroller
                                  .uploadUserCasePrescriptions.isEmpty) {
                                customErrorSnackBar(
                                    "Please Upload Prescriptions");
                              } else {
                                usercontroller.userUploadCase();
                              }
                            }
                          }),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

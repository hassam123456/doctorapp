import 'package:doctorapp/components/customSnackBar.dart';
import 'package:doctorapp/components/customcomponents.dart';
import 'package:doctorapp/controller/adminController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdminUploadVideoScreen extends StatefulWidget {
  const AdminUploadVideoScreen({super.key});

  @override
  State<AdminUploadVideoScreen> createState() => _AdminUploadVideoScreenState();
}

class _AdminUploadVideoScreenState extends State<AdminUploadVideoScreen> {
  final admincontroller = Get.put(AdminController(adminRepo: Get.find()));
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    admincontroller.adminuploadvideoimage.value = null;
    admincontroller.videotitlecontroller.value.clear();
    admincontroller.videocategorycontroller.value.clear();
    admincontroller.videodescriptioncontroller.value.clear();
    admincontroller.videourlcontroller.value.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customappbar(title: "Upload Video"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  "As an admin, you can add new Videos to offer personalized care information to the needs of your patients.",
                  style: TextStyle(color: Color(0xff949494), fontSize: 15.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                customtextformfield(
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "Please enter title";
                      }
                      return null;
                    },
                    controler: admincontroller.videotitlecontroller.value,
                    lable: "Title"),
                SizedBox(
                  height: 2.h,
                ),
                customtextformfield(
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "Please enter category";
                      }
                      return null;
                    },
                    controler: admincontroller.videocategorycontroller.value,
                    lable: "Category"),
                SizedBox(
                  height: 2.h,
                ),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      admincontroller.pickadminuploadvideoimage(context);
                    },
                    child: Container(
                        height: 25.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xff949494))),
                        child: admincontroller.adminuploadvideoimage.value ==
                                null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.file_upload_outlined),
                                  Text(
                                    "Upload Picture",
                                    style: TextStyle(fontSize: 17.sp),
                                  )
                                ],
                              )
                            : Image.file(
                                admincontroller.adminuploadvideoimage.value!,
                                fit: BoxFit.fill,
                                width: Get.width,
                              )),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextFormField(
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Please enter description";
                    }
                    return null;
                  },
                  controller: admincontroller.videodescriptioncontroller.value,
                  maxLines: 5,
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
                customtextformfield(
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "Please enter URL";
                      }
                      return null;
                    },
                    controler: admincontroller.videourlcontroller.value,
                    lable: "URL"),
                SizedBox(
                  height: 2.h,
                ),
                Obx(
                  () => admincontroller.createvideoloading.value
                      ? Center(
                          child: customcircularProgress(),
                        )
                      : custombutton(
                          title: "Add Video",
                          ontap: () {
                            if (formKey.currentState!.validate()) {
                              admincontroller.adminuploadvideoimage.value ==
                                      null
                                  ? customErrorSnackBar("Please Upload Image")
                                  : admincontroller.createVideo();
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

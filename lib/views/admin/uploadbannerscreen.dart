import 'package:doctorapp/components/customSnackBar.dart';
import 'package:doctorapp/components/customcomponents.dart';
import 'package:doctorapp/controller/adminController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Uploadbanner extends StatefulWidget {
  Uploadbanner({super.key});

  @override
  State<Uploadbanner> createState() => _UploadbannerState();
}

class _UploadbannerState extends State<Uploadbanner> {
  final admincontroller = Get.put(AdminController(adminRepo: Get.find()));
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  @override
  void initState() {
    super.initState();
    admincontroller.adminuploadbanner.value = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Form(
          key: _formKey, // Assign form key to the Form widget
          child: Column(
            children: [
              SizedBox(
                height: 4.h,
              ),
              Text(
                "As an admin, you can add new Banners to offer personalized care information to the needs of your patients.",
                style: TextStyle(color: Color(0xff949494), fontSize: 15.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    admincontroller.pickbannerimage(context);
                  },
                  child: Container(
                    height: 25.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xff949494)),
                    ),
                    child: admincontroller.adminuploadbanner.value == null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.file_upload_outlined),
                              Text(
                                "Upload Banner",
                                style: TextStyle(fontSize: 17.sp),
                              ),
                            ],
                          )
                        : Image.file(
                            admincontroller.adminuploadbanner.value!,
                            fit: BoxFit.fill,
                            width: Get.width,
                          ),
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              Obx(
                () => admincontroller.createebookloading.value
                    ? Center(
                        child: customcircularProgress(),
                      )
                    : custombutton(
                        title: "Submit",
                        ontap: () {
                          if (_formKey.currentState!.validate()) {
                            if (admincontroller.adminuploadbanner.value ==
                                null) {
                              customErrorSnackBar("Please Upload Banner Image");
                            } else {
                              admincontroller.createbanner();
                            }
                          }
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

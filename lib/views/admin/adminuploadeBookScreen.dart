import 'package:doctorapp/components/customSnackBar.dart';
import 'package:doctorapp/components/customcomponents.dart';
import 'package:doctorapp/controller/adminController.dart';
import 'package:doctorapp/controller/componentsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdminUploadEBookScreen extends StatefulWidget {
  const AdminUploadEBookScreen({super.key});

  @override
  State<AdminUploadEBookScreen> createState() => _AdminUploadEBookScreenState();
}

class _AdminUploadEBookScreenState extends State<AdminUploadEBookScreen> {
  final componentcontroller = Get.put(ComponentsController());
  final admincontroller = Get.put(AdminController(adminRepo: Get.find()));
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customappbar(title: "Upload E-Books"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  "As an admin, you can add new E-Books to offer personalized care information to the needs of your patients.",
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
                  controler: admincontroller.ebooktitlecontroller.value,
                  lable: "Title",
                ),
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
                    controler: admincontroller.ebookcategorycontroller.value,
                    lable: "Category"),
                SizedBox(
                  height: 2.h,
                ),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      admincontroller.pickadminuploadebookimage(context);
                    },
                    child: Container(
                        height: 25.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xff949494))),
                        child: admincontroller.adminuploadebookimage.value ==
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
                                admincontroller.adminuploadebookimage.value!,
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
                  controller: admincontroller.ebookdescriptioncontroller.value,
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
                    controler: admincontroller.ebookurlcontroller.value,
                    lable: "URL"),
                SizedBox(
                  height: 2.h,
                ),
                custombutton(
                    title: "Add E-Book",
                    ontap: () {
                      if (formKey.currentState!.validate()) {
                        admincontroller.adminuploadebookimage.value == null
                            ? customErrorSnackBar("Please Upload Image")
                            : admincontroller.createEbook();
                      }
                    }),
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

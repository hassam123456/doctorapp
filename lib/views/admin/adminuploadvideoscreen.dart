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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customappbar(title: "Upload Video"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        child: SingleChildScrollView(
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
                            color: const Color(0xff2E2E2E).withOpacity(0.02))),
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
              custombutton(
                  title: "Add Video",
                  ontap: () {
                    if (formKey.currentState!.validate()) {
                      admincontroller.createVideo();
                    }
                  }),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

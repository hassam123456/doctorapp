import 'package:doctorapp/components/customcomponents.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customappbar(title: "Upload E-Books"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "As an admin, you can add new E-Books to offer personalized care information to the needs of your patients.",
                style: TextStyle(color: Color(0xff949494), fontSize: 15.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              customtextformfield(lable: "Title"),
              SizedBox(
                height: 2.h,
              ),
              customtextformfield(lable: "Category"),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    componentcontroller.pickadminuploadebookimage(context);
                  },
                  child: Container(
                      height: 25.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xff949494))),
                      child: componentcontroller.adminuploadebookimage.value ==
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
                              componentcontroller.adminuploadebookimage.value!,
                              fit: BoxFit.fill,
                              width: Get.width,
                            )),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              TextFormField(
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
              customtextformfield(lable: "URL"),
              SizedBox(
                height: 2.h,
              ),
              custombutton(title: "Add E-Book", ontap: () {}),
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

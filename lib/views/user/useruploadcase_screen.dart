import 'package:doctorapp/components/customcomponents.dart';
import 'package:doctorapp/constants/colors.dart';
import 'package:doctorapp/constants/routeconstants.dart';
import 'package:doctorapp/controller/componentsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserUploadCaseScreen extends StatefulWidget {
  const UserUploadCaseScreen({super.key});

  @override
  State<UserUploadCaseScreen> createState() => _UserUploadCaseScreenState();
}

class _UserUploadCaseScreenState extends State<UserUploadCaseScreen> {
  final componentcontroller = Get.put(ComponentsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customappbar(
        title: "Upload Case",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customtextformfield(lable: "Case Number"),
              SizedBox(
                height: 2.h,
              ),
              customtextformfield(lable: "Case Title"),
              SizedBox(
                height: 2.h,
              ),
              customtextformfield(lable: "Patient Name"),
              SizedBox(
                height: 2.h,
              ),
              customnumbertextformfield(lable: "Patient Age"),
              SizedBox(
                height: 2.h,
              ),
              TextFormField(
                maxLength: 1000,
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
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: const Color(0xff2E2E2E).withOpacity(0.02))),
                    labelText: "Medical History"),
              ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  componentcontroller.pickUserCasePrescriptions(context);
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
                        "Upload Prescriptions",
                        style: TextStyle(color: Colors.black, fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => componentcontroller.uploadUserCasePrescriptions.isEmpty
                    ? const SizedBox()
                    : SizedBox(
                        height: 18.h,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: componentcontroller
                                      .uploadUserCasePrescriptions.length,
                                  itemBuilder: (context, index) {
                                    final prescimage = componentcontroller
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
                                              top: -1.h,
                                              child: GestureDetector(
                                                onTap: () {
                                                  componentcontroller
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
              custombutton(
                  title: "Upload",
                  ontap: () {
                    Get.toNamed(RouteConstants.casedetails);
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

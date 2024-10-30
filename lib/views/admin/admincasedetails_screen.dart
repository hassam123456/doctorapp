import 'package:doctorapp/components/customcomponents.dart';
import 'package:doctorapp/constants/colors.dart';
import 'package:doctorapp/constants/routeconstants.dart';
import 'package:doctorapp/controller/componentsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdminCaseDetailScreen extends StatefulWidget {
  const AdminCaseDetailScreen({super.key});

  @override
  State<AdminCaseDetailScreen> createState() => _AdminCaseDetailScreenState();
}

class _AdminCaseDetailScreenState extends State<AdminCaseDetailScreen> {
  final componentcontroller = Get.put(ComponentsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customappbar(
        title: "Case Details",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: "Status: ",
                  style: TextStyle(color: Color(0xff000000), fontSize: 15.sp),
                ),
                TextSpan(
                  text: "Pending",
                  style: TextStyle(color: Color(0xffFF0000), fontSize: 15.sp),
                ),
              ])),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteConstants.profilescreen);
                },
                child: Container(
                  height: 5.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color(0xff2E2E2E).withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "User Details",
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.sp),
                        ),
                        Text(
                          "View",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: mainColor,
                              color: mainColor,
                              fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              customadmincasedetailbox(
                  title: "Case Title",
                  subtitle: "Severe Hypertension in a 45-Year-Old Male"),
              SizedBox(
                height: 2.h,
              ),
              customadmincasedetailbox(
                  title: "Description",
                  subtitle:
                      "The patient presented with persistent high blood pressure despite ongoing treatment. Symptoms include headaches, dizziness, and shortness of breath."),
              SizedBox(
                height: 2.h,
              ),
              customadmincasedetailbox(
                  title: "Medical History",
                  subtitle:
                      "The patient has a history of diabetes and hypertension for the last 5 years. Previous treatments include medication A and medication B, with no significant improvement."),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 5.h,
                width: Get.width,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff34A853)),
                    color: const Color(0xff34A853).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Prescriptions",
                    style: TextStyle(color: Colors.black, fontSize: 16.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/Prescriptions1.png",
                    height: 15.h,
                    width: 40.w,
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    "assets/images/Prescriptions2.png",
                    height: 15.h,
                    width: 40.w,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              custombutton(
                  title: "Assigned to",
                  ontap: () {
                    Get.toNamed(RouteConstants.consultantlistscreen);
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

////////custom admin case details box
Container customadmincasedetailbox({
  required String title,
  required String subtitle,
}) {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff2E2E2E).withOpacity(0.2)),
        borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: const Color(0xff949494), fontSize: 16.sp),
          ),
          Text(
            subtitle,
            style: TextStyle(color: Colors.black, fontSize: 16.sp),
          ),
        ],
      ),
    ),
  );
}

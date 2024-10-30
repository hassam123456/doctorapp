import 'package:doctorapp/components/customcomponents.dart';
import 'package:doctorapp/constants/routeconstants.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdminCaseConsultScreen extends StatelessWidget {
  const AdminCaseConsultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customappbar(title: "Case Details"),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customsearchfield(title: "Search"),
              SizedBox(
                height: 2.h,
              ),
              admincaseconsultantListBox(
                  title: "Severe Hypertension in a 45-Year-Old Male",
                  description:
                      "This case involves a detailed examination of hypertension management, treatment history, and patient response to various medications.",
                  viewdetailontap: () {
                    Get.toNamed(RouteConstants.admincasedetailscreen);
                  },
                  days: "3 days ago"),
              SizedBox(
                height: 2.h,
              ),
              admincaseconsultantListBox(
                  title: "Type 2 Diabetes in an Obese Patient",
                  description:
                      "The patient, a 55-year-old female, presented with elevated blood sugar levels and weight issues. She reported fatigue and increased thirst.",
                  viewdetailontap: () {
                    Get.toNamed(RouteConstants.adminassignedcasedetailscreen);
                  },
                  days: "5 days ago"),
              SizedBox(
                height: 2.h,
              ),
              admincaseconsultantListBox(
                  title: "Severe Hypertension in a 45-Year-Old Male",
                  description:
                      "This case involves a detailed examination of hypertension management, treatment history, and patient response to various medications.",
                  viewdetailontap: () {
                    Get.toNamed(RouteConstants.admincasedetailscreen);
                  },
                  days: "8 days ago"),
              SizedBox(
                height: 2.h,
              ),
              admincaseconsultantListBox(
                  title: "Severe Hypertension in a 45-Year-Old Male",
                  description:
                      "This case involves a detailed examination of hypertension management, treatment history, and patient response to various medications.",
                  viewdetailontap: () {
                    Get.toNamed(RouteConstants.admincasedetailscreen);
                  },
                  days: "8 days ago"),
            ],
          ),
        ),
      ),
    );
  }
}

//////////admin case consult box

Container admincaseconsultantListBox({
  required String title,
  required String description,
  required VoidCallback viewdetailontap,
  required String days,
}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffD7D7D7))),
    child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: const Color(0xff34A853), fontSize: 16.sp),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              description,
              style: TextStyle(color: const Color(0xff848A94), fontSize: 15.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: viewdetailontap,
                  child: Text(
                    "View Detail",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xffFF0000),
                        color: Color(0xffFF0000),
                        fontSize: 17.sp),
                  ),
                ),
                Text(
                  days,
                  style: TextStyle(color: Color(0xff7A7979), fontSize: 15.sp),
                )
              ],
            )
          ],
        )),
  );
}

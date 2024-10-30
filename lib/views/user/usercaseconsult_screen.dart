import 'package:doctorapp/components/customcomponents.dart';
import 'package:doctorapp/components/customconsultantlistbox.dart';
import 'package:doctorapp/constants/routeconstants.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserCaseConsultScreen extends StatelessWidget {
  const UserCaseConsultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customappbar(title: "Case Consult"),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customsearchfield(title: "Search"),
              SizedBox(
                height: 2.h,
              ),
              customconsultantListBox(
                  title: "Severe Hypertension in a 45-Year-Old Male",
                  description:
                      "This case involves a detailed examination of hypertension management, treatment history, and patient response to various medications.",
                  status: "Pending",
                  days: "3 days ago"),
              SizedBox(
                height: 2.h,
              ),
              customconsultantListBox(
                  title: "Type 2 Diabetes in an Obese Patient",
                  description:
                      "The patient, a 55-year-old female, presented with elevated blood sugar levels and weight issues. She reported fatigue and increased thirst.",
                  status: "Assigned to Dr. Sanjay",
                  days: "5 days ago"),
              SizedBox(
                height: 2.h,
              ),
              customconsultantListBox(
                  title: "Severe Hypertension in a 45-Year-Old Male",
                  description:
                      "This case involves a detailed examination of hypertension management, treatment history, and patient response to various medications.",
                  status: " Assigned to Dr. Robert",
                  days: "8 days ago"),
              SizedBox(
                height: 10.h,
              ),
              custombutton(
                  title: "Upload New Case",
                  ontap: () {
                    Get.toNamed(RouteConstants.useruploadcasescreen);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

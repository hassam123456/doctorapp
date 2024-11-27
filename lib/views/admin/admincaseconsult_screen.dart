import 'package:doctorapp/components/customcomponents.dart';
import 'package:doctorapp/components/errordailog.dart';
import 'package:doctorapp/constants/routeconstants.dart';
import 'package:doctorapp/controller/adminController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdminCaseConsultScreen extends StatefulWidget {
  const AdminCaseConsultScreen({super.key});

  @override
  State<AdminCaseConsultScreen> createState() => _AdminCaseConsultScreenState();
}

class _AdminCaseConsultScreenState extends State<AdminCaseConsultScreen> {
  final admincontroller = Get.put(AdminController(adminRepo: Get.find()));

  @override
  void initState() {
    super.initState();
    admincontroller.getadmincaseconsult();
  }

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
              SizedBox(height: 2.h),

              // Reactive display using Obx
              Obx(() {
                // Check if loading
                if (admincontroller.addconsultantsloading.value) {
                  return Center(child: customcircularprogress());
                }

                // // Check for error message
                // if (admincontroller.admincaseconsult!..isNotEmpty) {
                //   return Center(child: Text(caseController.errorMessage.value));
                // }

                // Check if no cases are available
                if (admincontroller
                    .admincaseconsult.value!.data.cases.isEmpty) {
                  return Center(child: Text("No cases available"));
                }

                // Display case list
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      admincontroller.admincaseconsult.value!.data.cases.length,
                  itemBuilder: (context, index) {
                    final caseData = admincontroller
                        .admincaseconsult.value!.data.cases[index];
                    return admincaseconsultantListBox(
                      title: caseData.title,
                      description: caseData.description,
                      viewdetailontap: () {
                        admincontroller
                            .getAdminCaseById(caseData.id.toString());
                        Get.toNamed(RouteConstants.admincasedetailscreen);
                      },
                      days: "3 days ago",
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

// Admin case consultant list box
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

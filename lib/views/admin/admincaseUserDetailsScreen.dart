import 'package:doctorapp/components/customcomponents.dart';
import 'package:doctorapp/controller/adminController.dart';
import 'package:doctorapp/views/admin/adminalreadyassignedcasedetails_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdminCaseUserDetailScreen extends StatefulWidget {
  const AdminCaseUserDetailScreen({super.key});

  @override
  State<AdminCaseUserDetailScreen> createState() =>
      _AdminCaseUserDetailScreenState();
}

class _AdminCaseUserDetailScreenState extends State<AdminCaseUserDetailScreen> {
  final admincontroller = Get.put(AdminController(adminRepo: Get.find()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customappbar(
        title: "User Details",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customadmincasedetailbox(
                  title: "Full Name",
                  subtitle: admincontroller
                          .admingetcasebyid.value?.data?.cases?.user?.name
                          .toString() ??
                      ""),
              SizedBox(
                height: 2.h,
              ),
              customadmincasedetailbox(
                  title: "Clinic/Hospital Namee",
                  subtitle: admincontroller.admingetcasebyid.value?.data?.cases
                          ?.user?.hospitalName
                          .toString() ??
                      ""),
              SizedBox(
                height: 2.h,
              ),
              customadmincasedetailbox(
                  title: "Email Address",
                  subtitle: admincontroller
                          .admingetcasebyid.value?.data?.cases?.user?.email
                          .toString() ??
                      ""),
              SizedBox(
                height: 2.h,
              ),
              customadmincasedetailbox(
                  title: "Phone Number",
                  subtitle: admincontroller.admingetcasebyid.value?.data?.cases
                          ?.user?.phoneNumber
                          .toString() ??
                      ""),
              SizedBox(
                height: 2.h,
              ),
              customadmincasedetailbox(
                  title: "Address",
                  subtitle: admincontroller
                          .admingetcasebyid.value?.data?.cases?.user?.address
                          .toString() ??
                      ""),
              SizedBox(
                height: 2.h,
              ),
              customadmincasedetailbox(
                  title: "Medical License Number",
                  subtitle: admincontroller.admingetcasebyid.value?.data?.cases
                          ?.user?.licenseNumber
                          .toString() ??
                      ""),
              SizedBox(
                height: 2.h,
              ),
              customadmincasedetailbox(
                  title: "Specialization",
                  subtitle: admincontroller.admingetcasebyid.value?.data?.cases
                          ?.user?.specialization
                          .toString() ??
                      ""),
              SizedBox(
                height: 2.h,
              ),
              customadmincasedetailbox(
                  title: "Years of Experience",
                  subtitle: admincontroller
                          .admingetcasebyid.value?.data?.cases?.user?.experience
                          .toString() ??
                      ""),
              SizedBox(
                height: 4.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

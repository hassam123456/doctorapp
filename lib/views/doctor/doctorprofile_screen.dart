import 'package:doctorapp/controller/componentsController.dart';
import 'package:doctorapp/views/admin/adminalreadyassignedcasedetails_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen({super.key});

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  final componentcontroller = Get.put(ComponentsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 18.sp, color: const Color(0xff121212)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Your profile details have been set by the admin. You can review the information in your account. If you have any questions or require further assistance, please contact support.",
                style: TextStyle(color: Color(0xff949494), fontSize: 15.sp),
              ),
              SizedBox(
                height: 1.h,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/images/profile.png"),
                  ),
                  Positioned(
                    bottom: -0.5.h,
                    right: -1.w,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xff34A853),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              customadmincasedetailbox(
                  title: "Full Name", subtitle: "Dr. Sarah Johnson"),
              SizedBox(
                height: 2.h,
              ),
              customadmincasedetailbox(
                  title: "Clinic/Hospital Namee",
                  subtitle: "Heart Care Clinic"),
              SizedBox(
                height: 2.h,
              ),
              customadmincasedetailbox(
                  title: "Email Address",
                  subtitle: "dr.sarah.johnson@gmail.com"),
              SizedBox(
                height: 2.h,
              ),
              customadmincasedetailbox(
                  title: "Phone Number", subtitle: "(555) 123-4567"),
              SizedBox(
                height: 2.h,
              ),
              customadmincasedetailbox(
                  title: "Phone Number", subtitle: "(555) 123-4567"),
              SizedBox(
                height: 2.h,
              ),
              customadmincasedetailbox(
                  title: "Address",
                  subtitle:
                      "1234 Wellness Ave, Suite 101, Cityville, ST 56789"),
              SizedBox(
                height: 2.h,
              ),
              customadmincasedetailbox(
                  title: "Medical License Number", subtitle: "ABC123456787"),
              SizedBox(
                height: 2.h,
              ),
              customadmincasedetailbox(
                  title: "Specialization", subtitle: "Cardiologist"),
              SizedBox(
                height: 2.h,
              ),
              customadmincasedetailbox(
                  title: "Years of Experience", subtitle: "10 years"),
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

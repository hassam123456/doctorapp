import 'package:doctorapp/controller/componentsController.dart';
import 'package:doctorapp/views/admin/adminalreadyassignedcasedetails_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final componentcontroller = Get.put(ComponentsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "User Details",
          style: TextStyle(fontSize: 18.sp, color: const Color(0xff121212)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/images/profile.png"),
                  ),
                  Positioned(
                    bottom: -0.5.h,
                    right: -1.w,
                    child: const CircleAvatar(
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
                height: 4.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

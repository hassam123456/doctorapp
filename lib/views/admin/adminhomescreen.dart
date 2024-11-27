import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctorapp/components/customconsultantbox.dart';
import 'package:doctorapp/components/homeBox.dart';
import 'package:doctorapp/constants/colors.dart';
import 'package:doctorapp/constants/routeconstants.dart';
import 'package:doctorapp/controller/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final authcontroller = Get.put(AuthController(authRepo: Get.find()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RouteConstants.addconsultantscreen);
        },
        backgroundColor: mainColor,
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteConstants.notificationscreen);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Image.asset(
                    "assets/images/notificationicon.png",
                    height: 4.h,
                    width: 9.w,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  authcontroller.logout();
                },
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Icon(
                      Icons.logout,
                      size: 20.sp,
                      color: mainColor,
                    )),
              ),
            ],
          )
        ],
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.sp,
              backgroundImage: const AssetImage("assets/images/profile.png"),
            ),
            SizedBox(
              width: 1.w,
            ),
            Text(
              "Hello Admin",
              style: TextStyle(fontSize: 16.sp, color: const Color(0xff474747)),
            ),
            SizedBox(
              width: 1.w,
            ),
            Image.asset(
              "assets/images/helloicon.png",
              height: 3.h,
              width: 6.w,
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 4.h,
            ),
            CarouselSlider(
              options: CarouselOptions(autoPlay: true, height: 20.h),
              items: bannerimages.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Image.asset(
                        image,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customhomeBox(
                          image: "assets/images/homeimage1.png",
                          title: "Case Consult",
                          ontap: () {
                            Get.toNamed(RouteConstants.admincaseconsultscreen);
                          }),
                      customhomeBox(
                          image: "assets/images/homeimage2.png",
                          title: "Schedule Online  Consultant",
                          ontap: () {})
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customhomeBox(
                          image: "assets/images/homeimage3.png",
                          title: "E-Books",
                          ontap: () {
                            Get.toNamed(RouteConstants.adminuploadebookScreen);
                          }),
                      customhomeBox(
                          image: "assets/images/homeimage4.png",
                          title: "Basic Dental Procedures video Library",
                          ontap: () {
                            Get.toNamed(RouteConstants.adminuploadvideoScreen);
                          })
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Consultants",
                        style: TextStyle(
                            fontSize: 17.sp, color: Color(0xff474747)),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 15.sp,
                            color: mainColor),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: customConsultantBox(
                        image: "assets/images/doctorsplashpic.png",
                        name: "Dr. Sarah Thompson",
                        cases: "3 Active Cases",
                        speciality: "Obstetrician/Gynecologist",
                        hospital: "Cityville General Hospital",
                        ontap: () {}),
                  ),
                  customConsultantBox(
                      image: "assets/images/doctorimage2.png",
                      name: "Dr. Mark Johnson",
                      cases: "2 Active Cases",
                      speciality: "Urologist",
                      hospital: "Westfield Memorial Hospital",
                      ontap: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> bannerimages = [
  'assets/images/banner.png',
  'assets/images/banner.png',
  'assets/images/banner.png',
  'assets/images/banner.png',
];

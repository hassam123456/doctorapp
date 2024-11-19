import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctorapp/components/homeBox.dart';
import 'package:doctorapp/constants/colors.dart';
import 'package:doctorapp/constants/routeconstants.dart';
import 'package:doctorapp/controller/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  final authcontroller = Get.put(AuthController(authRepo: Get.find()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
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
        title: GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              CircleAvatar(
                radius: 20.sp,
                backgroundImage: const AssetImage("assets/images/profile.png"),
              ),
              SizedBox(
                width: 1.w,
              ),
              Text(
                "Hello Dr. Sara",
                style:
                    TextStyle(fontSize: 16.sp, color: const Color(0xff474747)),
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
      ),
      body: Column(
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
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customhomeBox(
                        image: "assets/images/homeimage1.png",
                        title: "Case Consult",
                        ontap: () {
                          Get.toNamed(RouteConstants.doctorcaseconsultscreen);
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
                          Get.toNamed(RouteConstants.ebookscreen);
                        }),
                    customhomeBox(
                        image: "assets/images/homeimage4.png",
                        title: "Basic Dental Procedures video Library",
                        ontap: () {
                          Get.toNamed(RouteConstants.videoscreen);
                        })
                  ],
                )
              ],
            ),
          )
        ],
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

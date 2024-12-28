import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctorapp/components/homeBox.dart';
import 'package:doctorapp/constants/colors.dart';
import 'package:doctorapp/constants/routeconstants.dart';
import 'package:doctorapp/controller/adminController.dart';
import 'package:doctorapp/controller/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final authcontroller = Get.put(AuthController(authRepo: Get.find()));
  final admincontroller = Get.put(AdminController(adminRepo: Get.find()));
  String? username; // State variable for storing username

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      admincontroller.getprofiledata();
      admincontroller.getbannerdata();
      fetchData();
    });
  }

  Future<void> fetchData() async {
    // Fetch username
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('name'); // Update state with fetched username
    });

    // Fetch other necessary data
    admincontroller.getconsultantlist();
    // admincontroller.getprofiledata();
  }

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
              ),
            ),
          ),
        ],
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.sp,
              backgroundImage: const AssetImage("assets/images/profile.png"),
            ),
            SizedBox(width: 1.w),
            Text(
              username != null
                  ? "Hello $username" // Show username if fetched
                  : "Hello Consultant", // Fallback text
              style: TextStyle(
                fontSize: 16.sp,
                color: const Color(0xff474747),
              ),
            ),
            SizedBox(width: 1.w),
            Image.asset(
              "assets/images/helloicon.png",
              height: 3.h,
              width: 6.w,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 4.h,
          ),
          Obx(() => admincontroller.bannerloading.value
              ? Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Center(child: const CircularProgressIndicator()),
                )
              : admincontroller.getbanner.value == null ||
                      admincontroller.getbanner.value!.data!.banners!.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Center(child: Text("No Top Banners")),
                    )
                  : CarouselSlider(
                      options: CarouselOptions(
                        height: 200,
                        enableInfiniteScroll: false,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 1.0,
                      ),
                      items: admincontroller.getbanner.value!.data.banners
                          .map((banners) {
                        return Card(
                          color: Color(0xFF8B2CA0),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              banners.media?.isNotEmpty == true &&
                                      banners.media![0].originalUrl != null
                                  ? banners.media![0].originalUrl!
                                  : 'https://your-placeholder-image-url.com/placeholder.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            (loadingProgress
                                                    .expectedTotalBytes ??
                                                1)
                                        : null,
                                  ),
                                );
                              },
                              errorBuilder: (BuildContext context, Object error,
                                  StackTrace? stackTrace) {
                                return Center(
                                  child: Text('Failed to load image',
                                      style: TextStyle(color: Colors.red)),
                                );
                              },
                            ),
                          ),
                        );
                      }).toList(),
                    )),
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
                          Get.toNamed(RouteConstants.usercaseconsultscreen);
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

import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctorapp/components/customconsultantbox.dart';
import 'package:doctorapp/components/homeBox.dart';
import 'package:doctorapp/constants/appconstant.dart';
import 'package:doctorapp/constants/colors.dart';
import 'package:doctorapp/constants/routeconstants.dart';
import 'package:doctorapp/controller/adminController.dart';
import 'package:doctorapp/controller/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final authcontroller = Get.put(AuthController(authRepo: Get.find()));
  final consultantController = Get.put(AdminController(adminRepo: Get.find()));
  final admincontroller = Get.put(AdminController(adminRepo: Get.find()));

  String? username; // State variable for storing username

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when the widget is initialized
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
                      width: 4.w,
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
              // CircleAvatar(
              //   radius: 20.sp,
              //   backgroundImage: const AssetImage("assets/images/profile.png"),
              // ),
              //  SizedBox(
              //     width: 1.w,
              //   ),
              Text(
                username != null
                    ? "Hello $username" // Show username if fetched
                    : "Hello Admin", // Fallback text
                style: TextStyle(
                  fontSize: 16.sp,
                  color: const Color(0xff474747),
                ),
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
            child: Column(children: [
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
                  children: <Widget>[
                    Text(
                      "Consultants",
                      style:
                          TextStyle(fontSize: 17.sp, color: Color(0xff474747)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteConstants.consultantseeallpage);
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 15.sp,
                            color: mainColor),
                      ),
                    )
                  ],
                ),
                Obx(() {
                  if (consultantController.consultantlistloading.value) {
                    return Center(child: CircularProgressIndicator());
                  }

                  // if (consultantController.errorMessage.isNotEmpty) {
                  //   return Center(
                  //       child: Text(consultantController.errorMessage.value));
                  // }

                  if (consultantController
                      .consultantlist.value!.data!.doctors!.isEmpty) {
                    return Center(child: Text("No consultants available"));
                  }

                  return SizedBox(
                    height: 40.h,
                    child: ListView.builder(
                      // Limit to 3 items maximum
                      itemCount: consultantController
                          .consultantlist.value!.data!.doctors!
                          .take(3)
                          .length, // Take only 3 items from the list
                      itemBuilder: (context, index) {
                        final consultant = consultantController
                            .consultantlist.value!.data!.doctors![index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(12),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                (consultant.media == null ||
                                        consultant.media!.isEmpty ||
                                        consultant.media![0].originalUrl ==
                                            null ||
                                        consultant
                                            .media![0].originalUrl!.isEmpty)
                                    ? AppConstants
                                        .noimage // Placeholder image for no media or empty URL
                                    : consultant.media![0].originalUrl
                                        .toString(),
                              ),
                              radius: 30,
                            ),
                            title: Text(
                              consultant.name!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xff334A853),
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${4} Active Cases'),
                                Text('Specialty: ${consultant.specialization}'),
                                Text('Hospital: ${consultant.hospitalName}'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        ])));
  }
}

List<String> bannerimages = [
  'assets/images/banner.png',
  'assets/images/banner.png',
  'assets/images/banner.png',
  'assets/images/banner.png',
];

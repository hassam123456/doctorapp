import 'package:doctorapp/components/customcomponents.dart';
import 'package:doctorapp/components/errordailog.dart';
import 'package:doctorapp/constants/appconstant.dart';
import 'package:doctorapp/controller/adminController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AdminController homecontroller = Get.put(
    AdminController(adminRepo: Get.find()),
  );

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    homecontroller.getProfileData();
    // Reset fields and states if needed
    homecontroller.updatesellerprofilename.value.clear();
    homecontroller.updatesellerprofilephonecode.value = '';
    homecontroller.updatesellerprofilephonenumber.value.clear();
    homecontroller.sellershopuploadedprofileImage.value = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customappbar(title: 'Profile'),
      body: SingleChildScrollView(
        child: Obx(() {
          if (homecontroller.getprofiledataloading.value) {
            // Show loading indicator while profile data is being fetched
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 35.h),
              child: Center(child: customcircularprogress()),
            );
          } else if (homecontroller.getprofiledata.value == null) {
            // Show fallback message when no profile data is available
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 35.h),
              child: const Center(child: Text("No Profile Data")),
            );
          } else {
            // Display profile data when loaded
            final profile = homecontroller.getprofiledata.value!;
            return Form(
              key: formKey,
              child: Column(
                children: [
                  // Header with profile background and picture
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 17.h,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/myprofilebackgroundimage.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 6.h,
                        left: 35.w,
                        right: 35.w,
                        child: GestureDetector(
                          onTap: () {
                            homecontroller
                                .uploadsellershopprofileImage(context);
                          },
                          child: Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Container(
                                //   decoration: BoxDecoration(
                                //     shape: BoxShape.circle,
                                //     border: Border.all(
                                //       color: const Color(0xffFFFFFF),
                                //       width: 5,
                                //     ),
                                //   ),
                                //   child: CircleAvatar(
                                //     radius: 32.sp,
                                //     backgroundImage: profile.data!.profile!
                                //                 .media?.isNotEmpty ==
                                //             true
                                //         ? NetworkImage(profile.data!.profile!
                                //             .media!.first.originalUrl!)
                                //         : const AssetImage(AppConstants.noimage)
                                //             as ImageProvider,
                                //   ),
                                // ),
                                Positioned(
                                  right: 5,
                                  bottom: 3,
                                  child: Container(
                                    width: 8.w,
                                    height: 6.h,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff2E3192),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'assets/images/myprofilecamera.png',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),

                  // Profile Name
                  Text(
                    profile.data!.profile!.name ?? "",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0XFF2E3192),
                    ),
                  ),

                  // Joined Date or Phone Code
                  Text(
                    "Joined since : ${profile.data!.profile!.phoneCode ?? ""}",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0XFF757474),
                      height: 0.9,
                    ),
                  ),
                  SizedBox(height: 1.h),

                  // Other Profile Details (Optional)
                  Padding(
                    padding: EdgeInsets.all(3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading:
                              const Icon(Icons.email, color: Color(0xff2E3192)),
                          title: Text(
                            profile.data!.profile!.email ?? "No Email",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                          ),
                        ),
                        ListTile(
                          leading:
                              const Icon(Icons.phone, color: Color(0xff2E3192)),
                          title: Text(
                            "${profile.data!.profile!.phoneCode ?? ""} ${profile.data!.profile!.phoneNumber ?? "No Phone"}",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.business,
                              color: Color(0xff2E3192)),
                          title: Text(
                            profile.data!.profile!.hospitalName! ??
                                "No Hospital Name",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                          ),
                        ),
                        ListTile(
                          leading:
                              const Icon(Icons.work, color: Color(0xff2E3192)),
                          title: Text(
                            profile.data!.profile!.experience ??
                                "No Experience Info",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}

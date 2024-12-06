import 'dart:io';
import 'package:doctorapp/components/customcomponents.dart';
import 'package:doctorapp/controller/adminController.dart';
import 'package:doctorapp/controller/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class Profileinfo extends StatefulWidget {
  @override
  _ProfileinfoState createState() => _ProfileinfoState();
}

class _ProfileinfoState extends State<Profileinfo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.put(AuthController(authRepo: Get.find()));
  final storecontroller = Get.put(AdminController(adminRepo: Get.find()));
  @override
  void initState() {
    super.initState();
    controller.getprofiledata();
    controller.profilenamecontroller.value.clear();
    controller.profilelastnamecontroller.value.clear();
    controller.profileemailcontroller.value.clear();
    controller.profilephonecontroller.value.clear();
    // storecontroller.searchController.clear();
  }

  // bool _isObscure = true; // For password visibility
  // bool _isConfirmObscure = true; // For confirm password visibilityur default country here
  // bool _isObscure2 = true;
  final List<String> countries = [
    'Poland',
    'Argentina',
    'Brazil',
    'Botswana',
  ];
  // File? uploadedProfileImage;
  Future<void> uploadImage() async {
    final picker = ImagePicker();
    final pickedImage = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Image Source"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text("Gallery"),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.gallery);
                  },
                ),
                SizedBox(height: 20),
                GestureDetector(
                  child: Text("Camera"),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
    if (pickedImage != null) {
      final pickedFile = await picker.pickImage(source: pickedImage);
      if (pickedFile != null) {
        setState(() {
          controller.uploadedProfileImage = File(pickedFile.path);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Set the background color to transparent
        elevation: 0.0, // Remove the shadow
        title: Padding(
          padding: EdgeInsets.only(top: 8.0), // Adjust the padding as needed
          child: Row(
            children: [
              Text(
                'Profile Settings',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ), // Your app bar title
        leading: Padding(
          padding: EdgeInsets.only(top: 10.0, right: 15),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              'assets/arrowback1.png',
            ),
          ),
        ),
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   automaticallyImplyLeading: false, // Remove the back button
      //   title: Row(
      //     children: [
      //       GestureDetector(
      //           onTap: () {
      //             Navigator.pop(context);
      //           },
      //           child: Image.asset('assets/arrowback.png')),
      //       SizedBox(width: MediaQuery.of(context).size.width * 0.03),
      //       Text(
      //         'Sign Up',
      //         style: TextStyle(
      //             color: Colors.black,
      //                  fontSize: 17,
      //             fontWeight: FontWeight.bold),
      //       ),
      //       SizedBox(width: MediaQuery.of(context).size.width * 0.54),
      //       Image.asset('assets/Group 421 (2).png'),
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Obx(
                () => Column(
                  children: [
                    // GestureDetector(
                    //   onTap: uploadImage,
                    //   child: CircleAvatar(
                    //       radius: 50,
                    //       backgroundImage: controller.uploadedProfileImage !=
                    //               null
                    //           ? FileImage(controller.uploadedProfileImage!)
                    //           : controller.profiledatalist.value!.data!.profile!
                    //                       .image !=
                    //                   null
                    //               ? NetworkImage(
                    //                   "${controller.profiledatalist.value?.data!.profile!.image}")
                    //               : NetworkImage(
                    //                       "https://www.pngitem.com/pimgs/m/522-5220445_anonymous-profile-grey-person-sticker-glitch-empty-profile.png")
                    //                   as ImageProvider),
                    // ),
                    Text(
                      controller.profiledatalist.value?.data!.profile!.name ??
                          'Name',
                      // 'Micheal Kroll',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                    ),

                    // Your form fields go here
                    // Example:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "First Name",
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
                          controller: controller.profilenamecontroller.value,
                          decoration: InputDecoration(
                            // labelText: "First Name",
                            suffixIcon: Image.asset('assets/editicon.png'),
                            contentPadding: EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffDBDBDB)),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            fillColor: Colors.white,
                            hintText: controller.profiledatalist.value!.data!
                                    .profile!.name!.isEmpty
                                ? 'First Name'
                                : controller
                                    .profiledatalist.value?.data!.profile!.name,
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          validator: (firstname) {
                            if (firstname != null && firstname.isNotEmpty) {
                              if (!RegExp(r'^[a-zA-Z\s]+$')
                                  .hasMatch(firstname)) {
                                return "Only letters and spaces allowed";
                              }
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z\s]')),
                          ],
                          onSaved: (value) {},
                        ),
                        // Repeat the pattern for other fields
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Last Name",
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        // Password field
                        TextFormField(
                          controller: controller.addressscontroller.value,
                          decoration: InputDecoration(
                            // labelText: "Last Name",
                            suffixIcon: Image.asset('assets/editicon.png'),
                            contentPadding: EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffDBDBDB)),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            fillColor: Colors.white,
                            hintText: controller.profiledatalist.value!.data!
                                    .profile!.address!.isEmpty
                                ? "Address"
                                : controller.profiledatalist.value!.data!
                                    .profile!.address,
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          validator: (lastname) {
                            if (lastname != null && lastname.isNotEmpty) {
                              if (!RegExp(r'^[a-zA-Z\s]+$')
                                  .hasMatch(lastname)) {
                                return "Only letters and spaces allowed";
                              }
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z\s]')),
                          ],
                          onSaved: (value) {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Email",
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        // Confirm Password field
                        TextFormField(
                          enabled: false,
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              final emailRegex =
                                  RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                              if (!emailRegex.hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                            }
                            return null;
                          },
                          controller: controller.profileemailcontroller.value,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffDBDBDB)),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            fillColor: Colors.white,

                            hintText: controller
                                .profiledatalist.value!.data!.profile!.email,
                            hintStyle: TextStyle(fontSize: 13),
                            // suffixIcon: Image.asset('assets/editicon.png'),
                          ),
                          // validator: null,
                          onSaved: (value) {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Phone Number",
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: controller.profilephonecontroller.value,
                          decoration: InputDecoration(
                            // labelText: "Phone Number",
                            contentPadding: EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffDBDBDB)),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            fillColor: Colors.white,
                            hintText: controller.profiledatalist.value!.data!
                                    .profile!.phoneNumber!.isEmpty
                                ? 'Phone Number'
                                : controller.profiledatalist.value?.data!
                                    .profile!.phoneNumber,
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 13),
                            suffixIcon: Image.asset('assets/editicon.png'),
                          ),
                          validator: null,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    // SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                    // () => controller.isLoading.value
                    //     ?  Center(
                    //         child: CircularProgressIndicator(
                    //           color: Colorant.creamColor,
                    //         ),
                    //       )
                    //     :
                    controller.upprofiledataloading.value
                        ? const CircularProgressIndicator()
                        : custombutton(
                            title: 'Done',

                            ontap: () {
                              if (_formKey.currentState!.validate()) {
                                controller.updateprofiledata();
                              }
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => Emailverification()),
                              // );
                            },
                            // : 14,
                            // width: MediaQuery.of(context).size.width * 0.92,
                            // gradientColors: [
                            //   Color(0xFF8B2CA0),
                            //   Color(0xFF00C3C9)
                            // ],
                          ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

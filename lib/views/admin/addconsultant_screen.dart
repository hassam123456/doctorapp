import 'package:doctorapp/components/customcomponents.dart';
import 'package:doctorapp/controller/adminController.dart';
import 'package:doctorapp/controller/componentsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddConsutltantScreen extends StatefulWidget {
  const AddConsutltantScreen({super.key});

  @override
  State<AddConsutltantScreen> createState() => _AddConsutltantScreenState();
}

class _AddConsutltantScreenState extends State<AddConsutltantScreen> {
  final componentcontroller = Get.put(ComponentsController());
  final admincontroller = Get.put(AdminController(adminRepo: Get.find()));
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customappbar(
        title: "Add Consultants",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  "As an admin, you can add new consultants to offer personalized care tailored to the needs of your patients.",
                  style: TextStyle(color: Color(0xff949494), fontSize: 15.sp),
                ),
                SizedBox(
                  height: 3.h,
                ),
                customtextformfield(
                  lable: "Full Name",
                  controler:
                      admincontroller.adminaddconsultantnamecontroller.value,
                  validator: (value) =>
                      value!.isEmpty ? 'Full Name is required' : null,
                ),
                SizedBox(
                  height: 2.h,
                ),
                customtextformfield(
                  lable: "Clinic/Hospital Name",
                  controler: admincontroller
                      .adminaddconsultanthospitalnamecontroller.value,
                  validator: (value) => value!.isEmpty
                      ? 'Clinic/Hospital Name is required'
                      : null,
                ),
                SizedBox(
                  height: 2.h,
                ),
                customtextformfield(
                    lable: "Email Address",
                    controler:
                        admincontroller.adminaddconsultantemailcontroller.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      } else if (!value.isEmail) {
                        return 'Invalid Email';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 2.h,
                ),
                customnumbertextformfield(
                    lable: "Phone Number",
                    controller: admincontroller
                        .adminaddconsultantphonenumbercontroller.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone Number is required';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 2.h,
                ),
                customtextformfield(
                    lable: "Address",
                    controler: admincontroller
                        .adminaddconsultantaddresscontroller.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Address is required';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 2.h,
                ),
                customtextformfield(
                    lable: "Medical License Number",
                    controler: admincontroller
                        .adminaddconsultantlicensecontroller.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'License Number is required';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 2.h,
                ),
                customtextformfield(
                    lable: "Specialization",
                    controler: admincontroller
                        .adminaddconsultantspecializationcontroller.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Specialization is required';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 2.h,
                ),
                customtextformfield(
                    lable: "Years of Experience",
                    controler: admincontroller
                        .adminaddconsultantexperiencecontroller.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Experience is required';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 2.h,
                ),
                Obx(
                  () => TextFormField(
                    controller: admincontroller
                        .adminaddconsultantpasswordcontroller.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                    obscureText:
                        componentcontroller.addconsultantpasssword.value
                            ? false
                            : true,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            componentcontroller.updateaddconsultantpasssword();
                          },
                          child: Icon(
                              componentcontroller.addconsultantpasssword.value
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color:
                                    const Color(0xff2E2E2E).withOpacity(0.02))),
                        labelText: "Password"),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Obx(
                  () => TextFormField(
                    controller: admincontroller
                        .adminaddconsultantconfirmpasswordcontroller.value,
                    validator: (value) {
                      if (value !=
                          admincontroller.adminaddconsultantpasswordcontroller
                              .value.text) {
                        return 'Password is Not Match';
                      }
                      return null;
                    },
                    obscureText:
                        componentcontroller.addconsultantconfpasssword.value
                            ? false
                            : true,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            componentcontroller
                                .updateaddconsultantconfpasssword();
                          },
                          child: Icon(componentcontroller
                                  .addconsultantconfpasssword.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color:
                                    const Color(0xff2E2E2E).withOpacity(0.02))),
                        labelText: "Confirm"),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Obx(
                  () => admincontroller.addconsultantsloading.value
                      ? Center(
                          child: customcircularProgress(),
                        )
                      : custombutton(
                          title: "Add Consultant",
                          ontap: () {
                            if (formKey.currentState!.validate()) {
                              admincontroller.addConsulant();
                            }
                          }),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

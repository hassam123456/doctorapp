import 'package:doctorapp/components/customcomponents.dart';
import 'package:doctorapp/components/customtextfield.dart';
import 'package:doctorapp/constants/appcolors.dart';
import 'package:doctorapp/constants/routeconstants.dart';
import 'package:doctorapp/controller/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final AuthController authController =
      Get.put(AuthController(authRepo: Get.find()));
  final String logintype = Get.arguments as String;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.fullNameController.clear();
    authController.signupemailController.clear();
    authController.clinicNameController.clear();
    authController.phoneController.clear();
    authController.addressController.value.clear();
    authController.licenseController.value.clear();
    authController.specializationController.value.clear();
    authController.experienceController.value.clear();
    authController.passwordController.clear();
    authController.confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Form(
            key: authController.formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Get Started',
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    'Get Started and Experience Seamless Help!',
                    style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                  ),
                  SizedBox(height: 2.h),

                  CustomTextField(
                    controller: authController.fullNameController,
                    label: 'Full Name',
                    validator: (value) =>
                        value!.isEmpty ? 'Full Name is required' : null,
                  ),
                  SizedBox(height: 2.h),

                  CustomTextField(
                    controller: authController.clinicNameController,
                    label: 'Clinic/Hospital Name',
                    validator: (value) => value!.isEmpty
                        ? 'Clinic/Hospital Name is required'
                        : null,
                  ),
                  SizedBox(height: 2.h),

                  // Email Address Field
                  CustomTextField(
                    controller: authController.signupemailController,
                    label: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => value!.isEmpty || !value.contains('@')
                        ? 'Enter a valid email'
                        : null,
                  ),
                  SizedBox(height: 2.h),

                  CustomTextField(
                    controller: authController.phoneController,
                    label: 'Phone Number',
                    keyboardType: TextInputType.phone,
                    validator: (value) =>
                        value!.isEmpty ? 'Phone Number is required' : null,
                  ),
                  SizedBox(height: 2.h),

                  CustomTextField(
                    controller: authController.addressController.value,
                    label: 'Address',
                    validator: (value) =>
                        value!.isEmpty ? 'Address is required' : null,
                  ),
                  SizedBox(height: 2.h),

                  CustomTextField(
                    controller: authController.licenseController.value,
                    label: 'Medical License Number',
                    validator: (value) => value!.isEmpty
                        ? 'Medical License Number is required'
                        : null,
                  ),
                  SizedBox(height: 2.h),

                  CustomTextField(
                    controller: authController.specializationController.value,
                    label: 'Specialization',
                    validator: (value) =>
                        value!.isEmpty ? 'Specialization is required' : null,
                  ),
                  SizedBox(height: 2.h),

                  CustomTextField(
                    controller: authController.experienceController.value,
                    label: 'Years of Experience',
                    keyboardType: TextInputType.number,
                    validator: (value) => value!.isEmpty
                        ? 'Years of Experience is required'
                        : null,
                  ),
                  SizedBox(height: 2.h),

                  CustomTextField(
                    controller: authController.passwordController,
                    label: 'Password',
                    obscureText: true,
                    validator: (value) => value!.length < 6
                        ? 'Password must be at least 6 characters'
                        : null,
                  ),
                  SizedBox(height: 2.h),

                  CustomTextField(
                    controller: authController.confirmPasswordController,
                    label: 'Confirm',
                    obscureText: true,
                    validator: (value) =>
                        value != authController.passwordController.text
                            ? 'Passwords do not match'
                            : null,
                  ),
                  SizedBox(height: 3.h),
                  Obx(
                    () => authController.signuploading.value
                        ? Center(
                            child: customcircularProgress(),
                          )
                        : SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (authController.formKey.currentState!
                                    .validate()) {
                                  authController.signup(logintype);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: EdgeInsets.symmetric(vertical: 2.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'Continue',
                                style: TextStyle(
                                    fontSize: 18.sp, color: Colors.white),
                              ),
                            ),
                          ),
                  ),
                  SizedBox(height: 2.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? ",
                          style: TextStyle(fontSize: 16.sp)),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(RouteConstants.signinscreen);
                        },
                        child: Text('Login',
                            style: TextStyle(color: AppColors.primaryColor)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

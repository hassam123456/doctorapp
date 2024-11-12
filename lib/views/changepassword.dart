import 'package:doctorapp/components/custombutton.dart';
import 'package:doctorapp/components/custompopup.dart';
import 'package:doctorapp/constants/appcolors.dart';
import 'package:doctorapp/controller/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangePassword extends StatelessWidget {
  final AuthController authController =
      Get.put(AuthController(authRepo: Get.find()));
  final GlobalKey<FormState> changeFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: changeFormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/loginpageimage.png'),
              SizedBox(height: 6.h),
              Text(
                'Reset Password',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              SizedBox(height: 1.h),
              Text(
                'Enter New Password Below.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 2.h),
              Obx(() => TextFormField(
                    controller: authController.changepasswordController,
                    obscureText: !authController.isPasswordVisible.value,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          authController.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: authController.togglePasswordVisibility,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  )),
              SizedBox(height: 2.h),
              Obx(() => TextFormField(
                    controller: authController.changeconfirmpasswordController,
                    obscureText: !authController.isConfirmPasswordVisible.value,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          authController.isConfirmPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed:
                            authController.toggleConfirmPasswordVisibility,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  )),
              SizedBox(height: 2.h),
              CustomLoginButton(
                onPressed: () {
                  showVerificationPopup(context, "Password Changed!",
                      "Your Password has been Successfully changed");
                },
                text: "Save",
                backgroundcolor: AppColors.primaryColor,
                textcolor: Colors.white,
              ),
              SizedBox(height: 2.h),
              CustomLoginButton(
                borderColor: Colors.grey,
                textcolor: Colors.black,
                onPressed: () {
                  Get.back();
                },
                text: "Cancel",
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }
}

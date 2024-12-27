import 'package:doctorapp/components/custombutton.dart';
import 'package:doctorapp/constants/appcolors.dart';
import 'package:doctorapp/controller/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgetPasswordPage extends StatelessWidget {
  final AuthController authController =
      Get.put(AuthController(authRepo: Get.find()));
  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  // final String logintype = Get.arguments as String;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: forgetPasswordFormKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/forgotpasswordimage.png'),
                SizedBox(height: 4.h),
                Text(
                  'Forget Password',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                ),
                SizedBox(height: 3.h),
                Text(
                  'Enter Your Email Address To Reset Your Password',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 2.h),
                TextFormField(
                  controller: authController.forgotemailController,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    if (!GetUtils.isEmail(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 4.h),
                CustomLoginButton(
                  backgroundcolor: AppColors.primaryColor,
                  textcolor: Colors.black,
                  onPressed: () {
                    if (forgetPasswordFormKey.currentState!.validate()) {
                      authController.sendOTP(
                        type: "1",
                        // logintyp: logintype,
                      );
                    }
                  },
                  text: "Send Code",
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
      ),
    );
  }
}

import 'package:doctorapp/components/custombutton.dart';
import 'package:doctorapp/constants/appcolors.dart';
import 'package:doctorapp/constants/routeconstants.dart';
import 'package:doctorapp/controller/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final String logintype = Get.arguments as String;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: loginFormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/loginpageimage.png'),
                SizedBox(height: 6.h),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                SizedBox(height: 1.h),
                Text(
                  'Enter Your Detail Below',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 2.h),
                TextFormField(
                  controller: authController.emailController,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(height: 2.h),
                TextFormField(
                  controller: authController.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility_off),
                      onPressed: () {},
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(height: 2.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(RouteConstants.forgotpage);
                    },
                    child: Text(
                      'Forget Your Password?',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                CustomLoginButton(
                  onPressed: () {
                    logintype == "admin"
                        ? Get.toNamed(RouteConstants.adminhomescreen)
                        : logintype == "consultant"
                            ? Get.toNamed(RouteConstants.doctorbottomnavbar)
                            : logintype == "user"
                                ? Get.toNamed(RouteConstants.userbottomnavbar)
                                : null;
                  },
                  text: "Login",
                  backgroundcolor: AppColors.primaryColor,
                  textcolor: Colors.white,
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(RouteConstants.signuppage);
                        // Navigate to signup screen
                      },
                      child: Text(
                        'Signup',
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

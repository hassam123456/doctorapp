import 'package:doctorapp/components/custombutton.dart';
import 'package:doctorapp/components/errordailog.dart';
import 'package:doctorapp/constants/appcolors.dart';
import 'package:doctorapp/constants/routeconstants.dart';
import 'package:doctorapp/controller/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController authController =
      Get.put(AuthController(authRepo: Get.find()));
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  bool _isTermsAccepted = false; // Variable to track checkbox state
  bool _isPasswordVisible = false; // Variable to toggle password visibility

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
                // Password field with eye icon
                TextFormField(
                  controller: authController.passwordController,
                  obscureText: !_isPasswordVisible, // Toggle visibility
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
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
                // Terms and conditions checkbox
                Row(
                  children: [
                    Checkbox(
                      value: _isTermsAccepted,
                      onChanged: (value) {
                        setState(() {
                          _isTermsAccepted = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteConstants.termsconditonn);
                        },
                        child: Text(
                          'Terms and Conditions',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                CustomLoginButton(
                  onPressed: () {
                    if (loginFormKey.currentState!.validate()) {
                      if (_isTermsAccepted) {
                        authController.login();
                      } else {
                        showErrrorSnackbar(
                            message:
                                "You must accept the terms and conditions.");
                      }
                    }
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

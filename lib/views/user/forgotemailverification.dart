import 'package:doctorapp/components/customSnackBar.dart';
import 'package:doctorapp/components/custombutton.dart';
import 'package:doctorapp/components/customcomponents.dart';
import 'package:doctorapp/constants/appcolors.dart';
import 'package:doctorapp/controller/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class ForgotEmailVerificationScreen extends StatefulWidget {
  @override
  State<ForgotEmailVerificationScreen> createState() =>
      _ForgotEmailVerificationScreenState();
}

class _ForgotEmailVerificationScreenState
    extends State<ForgotEmailVerificationScreen> {
  final authcontroller = Get.put(AuthController(authRepo: Get.find()));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authcontroller.emailverifycontrollers.clear();
    authcontroller.signupemailverificationotp.value = '';
  }

  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    String email = args['email'];
    // String isUser = args['isUser'];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Top image
              Image.asset(
                'assets/images/forgotpasswordimage.png', // Replace with your image path
              ),
              SizedBox(height: 4.h),

              Text(
                'Enter Verification Code',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 1.h),

              Text(
                'We have sent a code to $email',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
              SizedBox(height: 3.h),

              OtpTextField(
                handleControllers: (controllers) {
                  for (var controller in controllers) {
                    controller?.addListener(() {
                      authcontroller.signupemailverificationotp.value =
                          controllers
                              .map((controller) => controller?.text ?? '')
                              .join('');
                    });
                  }
                },
                numberOfFields: 5,
                borderColor: AppColors.primaryColor,
                focusedBorderColor: AppColors.primaryColor,
                showFieldAsBox: true,
                fieldWidth: 15.w,
                onSubmit: (String verificationCode) {
                  authcontroller.emailVerification(
                    type: "1",
                    otp: verificationCode.toString(),
                    // isUser: isUser,
                    email: email,
                    context: context,
                  );
                },
              ),
              SizedBox(height: 4.h),

              Obx(
                () => authcontroller.signupemailverificationloading.value
                    ? Center(
                        child: customcircularProgress(),
                      )
                    : CustomLoginButton(
                        backgroundcolor: AppColors.primaryColor,
                        textcolor: Colors.white,
                        onPressed: () {
                          if (authcontroller
                                  .signupemailverificationotp.value.isEmpty ||
                              authcontroller
                                      .signupemailverificationotp.value.length <
                                  5) {
                            customErrorSnackBar('Please enter a 5-digit code.');
                          } else {
                            authcontroller.emailVerification(
                              type: "1",
                              otp: authcontroller
                                  .signupemailverificationotp.value
                                  .toString(),
                              // isUser: isUser,
                              email: email,
                              context: context,
                            );
                          }
                        },
                        text: "Verify Code",
                      ),
              ),
              SizedBox(height: 2.h),

              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("If you didn’t receive a code? "),
                  Obx(
                    () => authcontroller.resendotploading.value
                        ? customcircularProgress()
                        : TextButton(
                            onPressed: () {
                              authcontroller.reSendOTP(email: email.toString());
                            },
                            child: Text(
                              'Resend Code',
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                          ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

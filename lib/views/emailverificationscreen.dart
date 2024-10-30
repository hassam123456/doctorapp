import 'package:doctorapp/components/custombutton.dart';
import 'package:doctorapp/components/custompopup.dart';
import 'package:doctorapp/constants/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class EmailVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
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
              'We have sent a code to dr.sarah.johnson@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            SizedBox(height: 3.h),

            OtpTextField(
              numberOfFields: 4,
              borderColor: AppColors.primaryColor,
              focusedBorderColor: AppColors.primaryColor,
              showFieldAsBox: true,
              fieldWidth: 15.w,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {},
            ),
            SizedBox(height: 4.h),

            CustomLoginButton(
              backgroundcolor: AppColors.primaryColor,
              textcolor: Colors.white,
              onPressed: () {
                showVerificationPopup(context, "Verification Done!",
                    "Now You Can Set Your New Password.");
              },
              text: "Verify Code",
            ),
            SizedBox(height: 2.h),

            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("If you didn’t receive a code? "),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend Code',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

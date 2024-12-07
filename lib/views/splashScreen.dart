import 'package:doctorapp/constants/routeconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  splashnavigate() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString("token");
    final String? isuser = prefs.getString("isuser");
    if (token == null || token.isEmpty) {
      Get.offNamed(RouteConstants.signinscreen);
    } else {
      if (isuser == "1") {
        Get.offNamed(RouteConstants.userbottomnavbar);
      } else if (isuser == "2") {
        Get.offNamed(RouteConstants.doctorbottomnavbar);
      } else {
        Get.offNamed(RouteConstants.adminhomescreen);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      splashnavigate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Welcome to Doctor App 👋',
                style: TextStyle(
                  fontSize: 17,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 22),
              Image.asset(
                'assets/images/doctorsplashpic.png', // Replace with your image URL
                height: 70.h,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

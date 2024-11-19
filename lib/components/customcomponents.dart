import 'dart:async';

import 'package:doctorapp/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

AppBar customappbar({
  required String title,
}) {
  return AppBar(
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Icon(
        Icons.arrow_back_ios_new,
        color: mainColor,
        size: 18.sp,
      ),
    ),
    title: Text(
      title,
      style: TextStyle(fontSize: 18.sp, color: const Color(0xff121212)),
    ),
  );
}

customcircularProgress() {
  return const CircularProgressIndicator(
    color: Color(0xff34A853),
  );
}

/////////////custom textformfield
TextFormField customtextformfield({
  required String lable,
  FormFieldValidator<String>? validator,
  TextEditingController? controler,
}) {
  return TextFormField(
    controller: controler,
    validator: validator,
    decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: const Color(0xff2E2E2E).withOpacity(0.02))),
        labelText: lable),
  );
}

/////////////custom number textformfield
TextFormField customnumbertextformfield({
  required String lable,
}) {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: const Color(0xff2E2E2E).withOpacity(0.02))),
        labelText: lable),
  );
}

////////////custom button
GestureDetector custombutton(
    {required String title, required VoidCallback ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: 5.h,
      width: Get.width,
      decoration: BoxDecoration(
          color: Color(0xff34A853), borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
      ),
    ),
  );
}

///////////custom search field
SizedBox customsearchfield({
  required String title,
}) {
  return SizedBox(
    height: 5.h,
    child: TextFormField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 1.h),
          prefixIcon: Icon(
            Icons.search_rounded,
            size: 20.sp,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: const Color(0xff2E2E2E).withOpacity(0.02))),
          hintText: title,
          hintStyle: TextStyle(
              fontSize: 18.sp, color: Color(0xff2E2E2E).withOpacity(0.4))),
    ),
  );
}

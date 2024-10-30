import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

GestureDetector customhomeBox({
  required String image,
  required String title,
  required VoidCallback ontap,
}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: 22.h,
      width: 45.w,
      decoration: BoxDecoration(
          color: Color(0xffF4F4F4),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xff38BE16))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 1.h,
          ),
          Image.asset(
            image,
            height: 10.h,
            width: 20.w,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyle(
              fontSize: 16.sp,
              color: const Color(0xff474747),
            ),
          )
        ],
      ),
    ),
  );
}

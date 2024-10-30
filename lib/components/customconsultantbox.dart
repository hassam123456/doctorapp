import 'package:doctorapp/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

GestureDetector customConsultantBox({
  required String image,
  required String name,
  required String cases,
  required String speciality,
  required String hospital,
  required VoidCallback ontap,
}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xffD7D7D7))),
      child: Row(
        children: [
          Image.asset(
            image,
            height: 14.h,
            width: 28.w,
            fit: BoxFit.fill,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
              child: SizedBox(
                width: 60.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(color: mainColor, fontSize: 16.sp),
                    ),
                    Text(
                      cases,
                      style: TextStyle(
                          color: const Color(0xff38BE16), fontSize: 16.sp),
                    ),
                    Text(
                      "Specialty: $speciality",
                      style:
                          TextStyle(color: Color(0xff7A7979), fontSize: 15.sp),
                    ),
                    Text(
                      "Hospital: $hospital",
                      style:
                          TextStyle(color: Color(0xff7A7979), fontSize: 15.sp),
                    )
                  ],
                ),
              ))
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Container customconsultantListBox({
  required String title,
  required String description,
  required String status,
  required String days,
}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffD7D7D7))),
    child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: const Color(0xff34A853), fontSize: 16.sp),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              description,
              style: TextStyle(color: const Color(0xff848A94), fontSize: 15.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "Status: ",
                    style: TextStyle(color: Color(0xff000000), fontSize: 15.sp),
                  ),
                  TextSpan(
                    text: status,
                    style: TextStyle(color: Color(0xffFF0000), fontSize: 15.sp),
                  ),
                ])),
                Text(
                  days,
                  style: TextStyle(color: Color(0xff7A7979), fontSize: 15.sp),
                )
              ],
            )
          ],
        )),
  );
}

import 'package:doctorapp/controller/componentsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CaseDetailsScreen extends StatefulWidget {
  const CaseDetailsScreen({super.key});

  @override
  State<CaseDetailsScreen> createState() => _CaseDetailsScreenState();
}

class _CaseDetailsScreenState extends State<CaseDetailsScreen> {
  final componentcontroller = Get.put(ComponentsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Medical History"),
        titleTextStyle: TextStyle(
            fontSize: 25.sp,
            color: const Color(0xff34A853),
            fontWeight: FontWeight.w700),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Mandatory Prior To Treatment ",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xff949494),
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              height: 30.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: const Color(0xff2E2E2E).withOpacity(0.2))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "CVS",
                          style: TextStyle(
                              color: const Color(0xff949494), fontSize: 17.sp),
                        ),
                        SizedBox(
                          width: 17.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Yes",
                                style: TextStyle(
                                    color: const Color(0xff949494),
                                    fontSize: 17.sp),
                              ),
                              Text(
                                "No",
                                style: TextStyle(
                                    color: const Color(0xff949494),
                                    fontSize: 17.sp),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hypertension / Hypotension",
                          style: TextStyle(
                              color: const Color(0xff000000), fontSize: 16.sp),
                        ),
                        SizedBox(
                          width: 25.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Radio<String>(
                                  value: "yes",
                                  groupValue: componentcontroller
                                      .casedetailradiobutton.value,
                                  onChanged: (String? value) {
                                    componentcontroller
                                        .updatecasedetailradiobutton(value!);
                                  }),
                              Radio<String>(
                                  value: "no",
                                  groupValue: componentcontroller
                                      .casedetailradiobutton.value,
                                  onChanged: (String? value) {
                                    componentcontroller
                                        .updatecasedetailradiobutton(value!);
                                  }),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

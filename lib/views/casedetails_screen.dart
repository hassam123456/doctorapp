import 'package:doctorapp/constants/colors.dart';
import 'package:doctorapp/constants/routeconstants.dart';
import 'package:doctorapp/controller/componentsController.dart';
import 'package:flutter/material.dart';
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
        child: SingleChildScrollView(
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
                height: 55.h,
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
                                color: const Color(0xff949494),
                                fontSize: 17.sp),
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
                      CustomRadioButtonRow(
                        group: "Hypertension",
                        title: "Hypertension / Hypotension",
                        onChanged: (value) {},
                      ),
                      CustomRadioButtonRow(
                        group: "Valvular",
                        title: "Valvular Heart Disease",
                        onChanged: (value) {},
                      ),
                      CustomRadioButtonRow(
                        group: "Angina",
                        title: "Angina Pectoris",
                        onChanged: (value) {},
                      ),
                      CustomRadioButtonRow(
                        group: "Myocardial",
                        title: "Myocardial Infarction",
                        onChanged: (value) {},
                      ),
                      CustomRadioButtonRow(
                        group: "Infective",
                        title: "Infective Endocarditis",
                        onChanged: (value) {},
                      ),
                      CustomRadioButtonRow(
                        group: "Cardiac",
                        title: "Cardiac Failure",
                        onChanged: (value) {},
                      ),
                      CustomRadioButtonRow(
                        group: "Surgery",
                        title: "Cardiac Surgery",
                        onChanged: (value) {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Other:",
                            style: TextStyle(
                              color: const Color(0xff000000),
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            width: 67.w,
                            child: TextFormField(),
                          )
                        ],
                      )
                    ],
                  ),
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
                            "GIT SYSTEM",
                            style: TextStyle(
                                color: const Color(0xff949494),
                                fontSize: 17.sp),
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
                      CustomRadioButtonRow(
                        group: "Nausea",
                        title: "Nausea",
                        onChanged: (value) {},
                      ),
                      CustomRadioButtonRow(
                        group: "Vomiting",
                        title: "Vomiting",
                        onChanged: (value) {},
                      ),
                      CustomRadioButtonRow(
                        group: "Peptic",
                        title: "Peptic Ulcer",
                        onChanged: (value) {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Other:",
                            style: TextStyle(
                              color: const Color(0xff000000),
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            width: 67.w,
                            child: TextFormField(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 36.h,
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
                            "RESPIRATORY SYSTEM",
                            style: TextStyle(
                                color: const Color(0xff949494),
                                fontSize: 17.sp),
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
                      CustomRadioButtonRow(
                        group: "ChestPain",
                        title: "Chest Pain",
                        onChanged: (value) {},
                      ),
                      CustomRadioButtonRow(
                        group: "Asthma",
                        title: "Asthma",
                        onChanged: (value) {},
                      ),
                      CustomRadioButtonRow(
                        group: "Bronchitis",
                        title: "Bronchitis",
                        onChanged: (value) {},
                      ),
                      CustomRadioButtonRow(
                        group: "Pneumonia",
                        title: "Pneumonia",
                        onChanged: (value) {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Other:",
                            style: TextStyle(
                              color: const Color(0xff000000),
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            width: 67.w,
                            child: TextFormField(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 18.h,
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
                            "REGAEDING TUBERCULOSES",
                            style: TextStyle(
                                color: const Color(0xff949494),
                                fontSize: 17.sp),
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
                      CustomRadioButtonRow(
                        group: "Tuberculossis",
                        title: "Tuberculossis (T.B)",
                        onChanged: (value) {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Other:",
                            style: TextStyle(
                              color: const Color(0xff000000),
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            width: 67.w,
                            child: TextFormField(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 18.h,
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
                            "REGAEDING HEPATITIS",
                            style: TextStyle(
                                color: const Color(0xff949494),
                                fontSize: 17.sp),
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
                      CustomRadioButtonRow(
                        group: "Hepatitis",
                        title: "Hepatitis",
                        onChanged: (value) {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Other:",
                            style: TextStyle(
                              color: const Color(0xff000000),
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            width: 67.w,
                            child: TextFormField(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 36.h,
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
                            "CIRCULATORY SYSTEM",
                            style: TextStyle(
                                color: const Color(0xff949494),
                                fontSize: 17.sp),
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
                      CustomRadioButtonRow(
                        group: "Anemia",
                        title: "Anemia",
                        onChanged: (value) {},
                      ),
                      CustomRadioButtonRow(
                        group: "BleedingDisorder",
                        title: "Bleeding Disorder",
                        onChanged: (value) {},
                      ),
                      CustomRadioButtonRow(
                        group: "ClothingDisorder",
                        title: "Clothing Disorder",
                        onChanged: (value) {},
                      ),
                      CustomRadioButtonRow(
                        group: "Leukemia",
                        title: "Leukemia",
                        onChanged: (value) {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Other:",
                            style: TextStyle(
                              color: const Color(0xff000000),
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            width: 67.w,
                            child: TextFormField(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 25.h,
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
                            "URINARY TRACT SYSTEM",
                            style: TextStyle(
                                color: const Color(0xff949494),
                                fontSize: 17.sp),
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
                      CustomRadioButtonRow(
                        group: "U.T.I",
                        title: "U.T.I",
                        onChanged: (value) {},
                      ),
                      CustomRadioButtonRow(
                        group: "KenalFailure",
                        title: "Kenal Failure",
                        onChanged: (value) {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Other:",
                            style: TextStyle(
                              color: const Color(0xff000000),
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            width: 67.w,
                            child: TextFormField(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 36.h,
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
                            "ENDOCRINE SYSTEM",
                            style: TextStyle(
                                color: const Color(0xff949494),
                                fontSize: 17.sp),
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
                      CustomRadioButtonRow(
                        group: "Diabetes",
                        title: "Diabetes",
                        onChanged: (value) {},
                      ),
                      CustomRadioButtonRow(
                        group: "Hyperparathyroidism",
                        title: "Hyperparathyroidism",
                        onChanged: (value) {},
                      ),
                      CustomRadioButtonRow(
                        group: "Hypothyroidism",
                        title: "Hypothyroidism",
                        onChanged: (value) {},
                      ),
                      CustomRadioButtonRow(
                        group: "Hyperthyroidism",
                        title: "Hyperthyroidism",
                        onChanged: (value) {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Other:",
                            style: TextStyle(
                              color: const Color(0xff000000),
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            width: 67.w,
                            child: TextFormField(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 25.h,
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
                            "NERVOUS SYSTEM",
                            style: TextStyle(
                                color: const Color(0xff949494),
                                fontSize: 17.sp),
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
                      CustomRadioButtonRow(
                        group: "Seizure",
                        title: "Seizure",
                        onChanged: (value) {},
                      ),
                      CustomRadioButtonRow(
                        group: "Epilepsy",
                        title: "Epilepsy",
                        onChanged: (value) {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Other:",
                            style: TextStyle(
                              color: const Color(0xff000000),
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            width: 67.w,
                            child: TextFormField(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.offAllNamed(RouteConstants.userbottomnavbar);
                },
                child: Container(
                  height: 5.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Color(0xff34A853),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      // "Sign Up",
                      "Upload",
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              // Center(
              //   child: GestureDetector(
              //     onTap: () {
              //       Get.offAllNamed(RouteConstants.splashscreen);
              //     },
              //     child: RichText(
              //         text: TextSpan(children: [
              //       TextSpan(
              //           text: "Already have account?  ",
              //           style: TextStyle(fontSize: 16.sp, color: Colors.black)),
              //       TextSpan(
              //           text: "Login",
              //           style: TextStyle(
              //               decoration: TextDecoration.underline,
              //               fontSize: 16.sp,
              //               color: mainColor)),
              //     ])),
              //   ),
              // ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/////////custom row
class CustomRadioButtonRow extends StatelessWidget {
  final String title;
  final String group;
  final ValueChanged<String?> onChanged;
  final Color fillColor;

  const CustomRadioButtonRow({
    Key? key,
    required this.title,
    required this.group,
    required this.onChanged,
    this.fillColor = const Color(0xFF34A853),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ComponentsController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: const Color(0xff000000),
            fontSize: 16.sp,
          ),
        ),
        Obx(
          () => SizedBox(
            width: 27.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Radio<String>(
                  fillColor: MaterialStateProperty.all(fillColor),
                  value: "yes",
                  groupValue: controller.radioGroupSelections[group]?.value,
                  onChanged: (value) {
                    if (value != null) {
                      onChanged(value);
                      controller.updateRadioButton(group, value);
                    }
                  },
                ),
                Radio<String>(
                  fillColor: MaterialStateProperty.all(fillColor),
                  value: "no",
                  groupValue: controller.radioGroupSelections[group]?.value,
                  onChanged: (value) {
                    if (value != null) {
                      onChanged(value);
                      controller.updateRadioButton(group, value);
                    }
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

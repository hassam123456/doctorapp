import 'package:doctorapp/components/customSnackBar.dart';
import 'package:doctorapp/components/customcomponents.dart';
import 'package:doctorapp/components/customtextfield.dart';
import 'package:doctorapp/controller/componentsController.dart';
import 'package:doctorapp/controller/userController.dart';
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
  final usercontroller = Get.put(UserController(userRepo: Get.find()));
  final String guid = Get.arguments as String;
  @override
  void initState() {
    super.initState();
    componentcontroller.radioGroupSelections.forEach((key, value) {
      value.value = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("History of Presenting Complain"),
        titleTextStyle: TextStyle(
            fontSize: 17.sp,
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color(0xff2E2E2E).withOpacity(0.2))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
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
                        onChanged: (value) {
                          usercontroller.uploadcasedetailshypertension.value =
                              value!;
                        },
                      ),
                      CustomRadioButtonRow(
                        group: "Valvular",
                        title: "Valvular Heart Disease",
                        onChanged: (value) {
                          usercontroller.uploadcasedetailsvalvular.value =
                              value!;
                        },
                      ),
                      CustomRadioButtonRow(
                        group: "Angina",
                        title: "Angina Pectoris",
                        onChanged: (value) {
                          usercontroller.uploadcasedetailsangina.value = value!;
                        },
                      ),
                      CustomRadioButtonRow(
                        group: "Myocardial",
                        title: "Myocardial Infarction",
                        onChanged: (value) {
                          usercontroller.uploadcasedetailsmyocardial.value =
                              value!;
                        },
                      ),
                      CustomRadioButtonRow(
                        group: "Infective",
                        title: "Infective Endocarditis",
                        onChanged: (value) {
                          usercontroller.uploadcasedetailsinfective.value =
                              value!;
                        },
                      ),
                      CustomRadioButtonRow(
                        group: "Cardiac",
                        title: "Cardiac Failure",
                        onChanged: (value) {
                          usercontroller.uploadcasedetailsfailure.value =
                              value!;
                        },
                      ),
                      CustomRadioButtonRow(
                        group: "Surgery",
                        title: "Cardiac Surgery",
                        onChanged: (value) {
                          usercontroller.uploadcasedetailssurgery.value =
                              value!;
                        },
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
                            child: TextFormField(
                              controller: usercontroller
                                  .uploadcasedetailscvsother.value,
                            ),
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color(0xff2E2E2E).withOpacity(0.2))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
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
                        onChanged: (value) {
                          usercontroller.uploadcasedetailsnausea.value = value!;
                        },
                      ),
                      CustomRadioButtonRow(
                        group: "Vomiting",
                        title: "Vomiting",
                        onChanged: (value) {
                          usercontroller.uploadcasedetailsvomiting.value =
                              value!;
                        },
                      ),
                      CustomRadioButtonRow(
                        group: "Peptic",
                        title: "Peptic Ulcer",
                        onChanged: (value) {
                          usercontroller.uploadcasedetailspeptic.value = value!;
                        },
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
                            child: TextFormField(
                              controller: usercontroller
                                  .uploadcasedetailsgitother.value,
                            ),
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color(0xff2E2E2E).withOpacity(0.2))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
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
                        onChanged: (value) {
                          usercontroller.uploadcasedetailschestpain.value =
                              value!;
                        },
                      ),
                      CustomRadioButtonRow(
                        group: "Asthma",
                        title: "Asthma",
                        onChanged: (value) {
                          usercontroller.uploadcasedetailsasthma.value = value!;
                        },
                      ),
                      CustomRadioButtonRow(
                        group: "Bronchitis",
                        title: "Bronchitis",
                        onChanged: (value) {
                          usercontroller.uploadcasedetailsbronchitis.value =
                              value!;
                        },
                      ),
                      CustomRadioButtonRow(
                        group: "Pneumonia",
                        title: "Pneumonia",
                        onChanged: (value) {
                          usercontroller.uploadcasedetailspneumonia.value =
                              value!;
                        },
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
                            child: TextFormField(
                              controller: usercontroller
                                  .uploadcasedetailsrespiratoryother.value,
                            ),
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color(0xff2E2E2E).withOpacity(0.2))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
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
                        onChanged: (value) {
                          usercontroller.uploadcasedetailstuberculossis.value =
                              value!;
                        },
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
                            child: TextFormField(
                              controller: usercontroller
                                  .uploadcasedetailstuberculossisother.value,
                            ),
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color(0xff2E2E2E).withOpacity(0.2))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
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
                        onChanged: (value) {
                          usercontroller.uploadcasedetailshepatitis.value =
                              value!;
                        },
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
                            child: TextFormField(
                              controller: usercontroller
                                  .uploadcasedetailshepatitisother.value,
                            ),
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color(0xff2E2E2E).withOpacity(0.2))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
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
                        onChanged: (value) {
                          usercontroller.uploadcasedetailsanemia.value = value!;
                        },
                      ),
                      CustomRadioButtonRow(
                        group: "BleedingDisorder",
                        title: "Bleeding Disorder",
                        onChanged: (value) {
                          usercontroller
                              .uploadcasedetailsbleedingdisorder.value = value!;
                        },
                      ),
                      CustomRadioButtonRow(
                        group: "ClothingDisorder",
                        title: "Clothing Disorder",
                        onChanged: (value) {
                          usercontroller
                              .uploadcasedetailsclothingdisorder.value = value!;
                        },
                      ),
                      CustomRadioButtonRow(
                        group: "Leukemia",
                        title: "Leukemia",
                        onChanged: (value) {
                          usercontroller.uploadcasedetailsleukemia.value =
                              value!;
                        },
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
                            child: TextFormField(
                              controller: usercontroller
                                  .uploadcasedetailcirculatoryother.value,
                            ),
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color(0xff2E2E2E).withOpacity(0.2))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
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
                        onChanged: (value) {
                          usercontroller.uploadcasedetailsuti.value = value!;
                        },
                      ),
                      CustomRadioButtonRow(
                        group: "KenalFailure",
                        title: "Kenal Failure",
                        onChanged: (value) {
                          usercontroller.uploadcasedetailskenalfailure.value =
                              value!;
                        },
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
                            child: TextFormField(
                              controller: usercontroller
                                  .uploadcasedetailsurinaryother.value,
                            ),
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color(0xff2E2E2E).withOpacity(0.2))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
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
                        onChanged: (value) {
                          usercontroller.uploadcasedetailsdiabetes.value =
                              value!;
                        },
                      ),
                      CustomRadioButtonRow(
                        group: "Hyperparathyroidism",
                        title: "Hyperparathyroidism",
                        onChanged: (value) {
                          usercontroller.uploadcasedetailshyperparathyrodism
                              .value = value!;
                        },
                      ),
                      CustomRadioButtonRow(
                        group: "Hypothyroidism",
                        title: "Hypothyroidism",
                        onChanged: (value) {
                          usercontroller.uploadcasedetailshypothyroidism.value =
                              value!;
                        },
                      ),
                      CustomRadioButtonRow(
                        group: "Hyperthyroidism",
                        title: "Hyperthyroidism",
                        onChanged: (value) {
                          usercontroller.uploadcasedetailshyperthyrodism.value =
                              value!;
                        },
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
                            child: TextFormField(
                              controller: usercontroller
                                  .uploadcasedetailsendocrineother.value,
                            ),
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color(0xff2E2E2E).withOpacity(0.2))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
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
                        onChanged: (value) {
                          usercontroller.uploadcasedetailsseizure.value =
                              value!;
                        },
                      ),
                      CustomRadioButtonRow(
                        group: "Epilepsy",
                        title: "Epilepsy",
                        onChanged: (value) {
                          usercontroller.uploadcasedetailsepilepsy.value =
                              value!;
                        },
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
                            child: TextFormField(
                              controller: usercontroller
                                  .uploadcasedetailsnervousother.value,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 1.h,
              ),
              CustomTextField(
                controller: usercontroller.uploadcasedetailsdrughistory.value,
                label: 'Drug History',
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => usercontroller.useruploadcasedetailsloading.value
                    ? Center(
                        child: customcircularProgress(),
                      )
                    : GestureDetector(
                        onTap: () {
                          List<RxString> requiredFields = [
                            usercontroller.uploadcasedetailshypertension,
                            usercontroller.uploadcasedetailsvalvular,
                            usercontroller.uploadcasedetailsangina,
                            usercontroller.uploadcasedetailsmyocardial,
                            usercontroller.uploadcasedetailsinfective,
                            usercontroller.uploadcasedetailsfailure,
                            usercontroller.uploadcasedetailssurgery,
                            usercontroller.uploadcasedetailsnausea,
                            usercontroller.uploadcasedetailsvomiting,
                            usercontroller.uploadcasedetailspeptic,
                            usercontroller.uploadcasedetailschestpain,
                            usercontroller.uploadcasedetailsasthma,
                            usercontroller.uploadcasedetailsbronchitis,
                            usercontroller.uploadcasedetailspneumonia,
                            usercontroller.uploadcasedetailstuberculossis,
                            usercontroller.uploadcasedetailshepatitis,
                            usercontroller.uploadcasedetailsanemia,
                            usercontroller.uploadcasedetailsbleedingdisorder,
                            usercontroller.uploadcasedetailsclothingdisorder,
                            usercontroller.uploadcasedetailsleukemia,
                            usercontroller.uploadcasedetailsuti,
                            usercontroller.uploadcasedetailskenalfailure,
                            usercontroller.uploadcasedetailsdiabetes,
                            usercontroller.uploadcasedetailshyperparathyrodism,
                            usercontroller.uploadcasedetailshypothyroidism,
                            usercontroller.uploadcasedetailshyperthyrodism,
                            usercontroller.uploadcasedetailsseizure,
                            usercontroller.uploadcasedetailsepilepsy
                          ];
                          bool isAnyFieldEmpty = requiredFields
                              .any((field) => field.value.isEmpty);

                          if (isAnyFieldEmpty) {
                            customErrorSnackBar(
                                "Please Fill Complete Case Details");
                          } else {
                            usercontroller.userUploadCaseDetails(
                                guid: guid.toString());
                          }
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
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp),
                            ),
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
                  value: "1",
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
                  value: "0",
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

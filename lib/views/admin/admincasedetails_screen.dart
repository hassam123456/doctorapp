import 'package:doctorapp/components/customcomponents.dart';
import 'package:doctorapp/components/customconsultantbox.dart';
import 'package:doctorapp/constants/appconstant.dart';
import 'package:doctorapp/constants/colors.dart';
import 'package:doctorapp/constants/routeconstants.dart';
import 'package:doctorapp/controller/adminController.dart';
import 'package:doctorapp/controller/componentsController.dart';
import 'package:doctorapp/views/consultantlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdminCaseDetailScreen extends StatefulWidget {
  const AdminCaseDetailScreen({super.key});

  @override
  State<AdminCaseDetailScreen> createState() => _AdminCaseDetailScreenState();
}

class _AdminCaseDetailScreenState extends State<AdminCaseDetailScreen> {
  final componentcontroller = Get.put(ComponentsController());
  final admincontroller = Get.put(AdminController(adminRepo: Get.find()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customappbar(
        title: "Case Details",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
        child: SingleChildScrollView(
            child: Obx(
          () => admincontroller.admingetcasebyidloading.value
              ? Center(
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.h),
                      child: customcircularProgress()),
                )
              : admincontroller.admingetcasebyid.value == null ||
                      admincontroller.admingetcasebyid.value?.data == null ||
                      admincontroller.admingetcasebyid.value?.data?.cases ==
                          null
                  ? Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.h),
                      child: Center(child: const Text("No Case Details")),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        admincontroller.admingetcasebyid.value?.data?.cases
                                    ?.doctor ==
                                null
                            ? const SizedBox()
                            : customConsultantBox(
                                image: "assets/images/noimage.jpg",
                                name: admincontroller.admingetcasebyid.value
                                        ?.data?.cases?.doctor?.name
                                        .toString() ??
                                    "",
                                cases: "Active Cases",
                                speciality: admincontroller
                                        .admingetcasebyid
                                        .value
                                        ?.data
                                        ?.cases
                                        ?.doctor
                                        ?.specialization
                                        .toString() ??
                                    "",
                                hospital: admincontroller.admingetcasebyid.value
                                        ?.data?.cases?.doctor?.hospitalName
                                        .toString() ??
                                    "",
                                ontap: () {
                                  // Get.toNamed(RouteConstants.profilescreen);
                                }),
                        SizedBox(
                          height: 2.h,
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: "Status: ",
                            style: TextStyle(
                                color: Color(0xff000000), fontSize: 15.sp),
                          ),
                          TextSpan(
                            text: admincontroller
                                    .admingetcasebyid.value?.data?.cases?.status
                                    .toString() ??
                                "",
                            style: TextStyle(
                                color: Color(0xffFF0000), fontSize: 15.sp),
                          ),
                        ])),
                        SizedBox(
                          height: 2.h,
                        ),
                        admincontroller.admingetcasebyid.value?.data?.cases
                                    ?.user ==
                                null
                            ? const SizedBox()
                            : GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                      RouteConstants.admincaseuserdetailscreen);
                                },
                                child: Container(
                                  height: 5.h,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xff2E2E2E)
                                              .withOpacity(0.2)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "User Details",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.sp),
                                        ),
                                        Text(
                                          "View",
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor: mainColor,
                                              color: mainColor,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 2.h,
                        ),
                        customadmincasedetailbox(
                            title: "Case Title",
                            subtitle: admincontroller
                                    .admingetcasebyid.value?.data?.cases?.title
                                    .toString() ??
                                ""),
                        SizedBox(
                          height: 2.h,
                        ),
                        customadmincasedetailbox(
                            title: "Description",
                            subtitle: admincontroller.admingetcasebyid.value
                                    ?.data?.cases?.description
                                    .toString() ??
                                ""),
                        SizedBox(
                          height: 2.h,
                        ),
                        customadmincasedetailbox(
                            title: "Medical History",
                            subtitle: admincontroller.admingetcasebyid.value
                                    ?.data?.cases?.history
                                    .toString() ??
                                ""),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          height: 5.h,
                          width: Get.width,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xff34A853)),
                              color: const Color(0xff34A853).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "Xray / Investigation",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.sp),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        admincontroller.admingetcasebyid.value!.data!.cases!
                                    .media!.isEmpty ||
                                admincontroller.admingetcasebyid.value?.data
                                        ?.cases?.media ==
                                    null
                            ? const SizedBox()
                            : SizedBox(
                                height: 16.h,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ...admincontroller.admingetcasebyid.value!
                                          .data!.cases!.media!
                                          .map(
                                        (media) => Padding(
                                          padding: EdgeInsets.only(right: 2.w),
                                          child: Image.network(
                                            media.originalUrl ??
                                                AppConstants.noimage,
                                            height: 15.h,
                                            width: 40.w,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 2.h,
                        ),
                        admincontroller
                                    .admingetcasebyid.value?.data?.cases?.cvs ==
                                null
                            ? SizedBox()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color(0xff2E2E2E)
                                            .withOpacity(0.2),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w, vertical: 1.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "CVS",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xff949494),
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                              Text(
                                                "Yes/No",
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xff949494),
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Hypertension / Hypotension",
                                            result: (admincontroller
                                                        .admingetcasebyid
                                                        .value
                                                        ?.data
                                                        ?.cases
                                                        ?.cvs
                                                        ?.hypertension ==
                                                    "0")
                                                ? "No"
                                                : (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.hypertension ==
                                                        "1")
                                                    ? "Yes"
                                                    : "",
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Valvular Heart Disease",
                                            result: (admincontroller
                                                        .admingetcasebyid
                                                        .value
                                                        ?.data
                                                        ?.cases
                                                        ?.cvs
                                                        ?.valvular ==
                                                    "0")
                                                ? "No"
                                                : (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.valvular ==
                                                        "1")
                                                    ? "Yes"
                                                    : "",
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Angina Pectoris",
                                            result: (admincontroller
                                                        .admingetcasebyid
                                                        .value
                                                        ?.data
                                                        ?.cases
                                                        ?.cvs
                                                        ?.angina ==
                                                    "0")
                                                ? "No"
                                                : (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.angina ==
                                                        "1")
                                                    ? "Yes"
                                                    : "",
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Myocardial Infarction",
                                            result: (admincontroller
                                                        .admingetcasebyid
                                                        .value
                                                        ?.data
                                                        ?.cases
                                                        ?.cvs
                                                        ?.myocardial ==
                                                    "0")
                                                ? "No"
                                                : (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.myocardial ==
                                                        "1")
                                                    ? "Yes"
                                                    : "",
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Infective Endocarditis",
                                            result: (admincontroller
                                                        .admingetcasebyid
                                                        .value
                                                        ?.data
                                                        ?.cases
                                                        ?.cvs
                                                        ?.infective ==
                                                    "0")
                                                ? "No"
                                                : (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.infective ==
                                                        "1")
                                                    ? "Yes"
                                                    : "",
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Cardiac Failure",
                                            result: (admincontroller
                                                        .admingetcasebyid
                                                        .value
                                                        ?.data
                                                        ?.cases
                                                        ?.cvs
                                                        ?.failure ==
                                                    "0")
                                                ? "No"
                                                : (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.failure ==
                                                        "1")
                                                    ? "Yes"
                                                    : "",
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Cardiac Surgery",
                                            result: (admincontroller
                                                        .admingetcasebyid
                                                        .value
                                                        ?.data
                                                        ?.cases
                                                        ?.cvs
                                                        ?.surgery ==
                                                    "0")
                                                ? "No"
                                                : (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.surgery ==
                                                        "1")
                                                    ? "Yes"
                                                    : "",
                                          ),
                                          customcasedetailOtherText(
                                            "Other: ${admincontroller.admingetcasebyid.value?.data?.cases?.cvs?.others ?? ""}",
                                          ),
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
                                        color: const Color(0xff2E2E2E)
                                            .withOpacity(0.2),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w, vertical: 1.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "GIT SYSTEM",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xff949494),
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                              Text(
                                                "Yes/No",
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xff949494),
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Nausea",
                                            result: (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.nausea
                                                            .toString() ??
                                                        "") ==
                                                    "0"
                                                ? "No"
                                                : (admincontroller
                                                                .admingetcasebyid
                                                                .value
                                                                ?.data
                                                                ?.cases
                                                                ?.cvs
                                                                ?.nausea
                                                                .toString() ??
                                                            "") ==
                                                        "1"
                                                    ? "Yes"
                                                    : "",
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Vomiting",
                                            result: (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.vomiting
                                                            .toString() ??
                                                        "") ==
                                                    "0"
                                                ? "No"
                                                : (admincontroller
                                                                .admingetcasebyid
                                                                .value
                                                                ?.data
                                                                ?.cases
                                                                ?.cvs
                                                                ?.vomiting
                                                                .toString() ??
                                                            "") ==
                                                        "1"
                                                    ? "Yes"
                                                    : "",
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Peptic Ulcer",
                                            result: (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.peptic
                                                            .toString() ??
                                                        "") ==
                                                    "0"
                                                ? "No"
                                                : (admincontroller
                                                                .admingetcasebyid
                                                                .value
                                                                ?.data
                                                                ?.cases
                                                                ?.cvs
                                                                ?.peptic
                                                                .toString() ??
                                                            "") ==
                                                        "1"
                                                    ? "Yes"
                                                    : "",
                                          ),
                                          customcasedetailOtherText(
                                            "Other: ${admincontroller.admingetcasebyid.value?.data?.cases?.cvs?.gutOthers == null ? "" : admincontroller.admingetcasebyid.value?.data?.cases?.cvs?.gutOthers.toString() ?? ""}",
                                          ),
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
                                        color: const Color(0xff2E2E2E)
                                            .withOpacity(0.2),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w, vertical: 1.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "RESPIRATORY SYSTEM",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xff949494),
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                              Text(
                                                "Yes/No",
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xff949494),
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Chest Pain",
                                            result: (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.chestPain
                                                            .toString() ??
                                                        "") ==
                                                    "0"
                                                ? "No"
                                                : (admincontroller
                                                                .admingetcasebyid
                                                                .value
                                                                ?.data
                                                                ?.cases
                                                                ?.cvs
                                                                ?.chestPain
                                                                .toString() ??
                                                            "") ==
                                                        "1"
                                                    ? "Yes"
                                                    : "",
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Asthma",
                                            result: (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.asthma
                                                            .toString() ??
                                                        "") ==
                                                    "0"
                                                ? "No"
                                                : (admincontroller
                                                                .admingetcasebyid
                                                                .value
                                                                ?.data
                                                                ?.cases
                                                                ?.cvs
                                                                ?.asthma
                                                                .toString() ??
                                                            "") ==
                                                        "1"
                                                    ? "Yes"
                                                    : "",
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Bronchitis",
                                            result: (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.bronchitis
                                                            .toString() ??
                                                        "") ==
                                                    "0"
                                                ? "No"
                                                : (admincontroller
                                                                .admingetcasebyid
                                                                .value
                                                                ?.data
                                                                ?.cases
                                                                ?.cvs
                                                                ?.bronchitis
                                                                .toString() ??
                                                            "") ==
                                                        "1"
                                                    ? "Yes"
                                                    : "",
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Pneumonia",
                                            result: (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.pneumonia
                                                            .toString() ??
                                                        "") ==
                                                    "0"
                                                ? "No"
                                                : (admincontroller
                                                                .admingetcasebyid
                                                                .value
                                                                ?.data
                                                                ?.cases
                                                                ?.cvs
                                                                ?.pneumonia
                                                                .toString() ??
                                                            "") ==
                                                        "1"
                                                    ? "Yes"
                                                    : "",
                                          ),
                                          customcasedetailOtherText(
                                            "Other: ${admincontroller.admingetcasebyid.value?.data?.cases?.cvs?.respOthers == null ? "" : admincontroller.admingetcasebyid.value?.data?.cases?.cvs?.respOthers.toString() ?? ""}",
                                          ),
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
                                        color: const Color(0xff2E2E2E)
                                            .withOpacity(0.2),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w, vertical: 1.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "REGARDING\nTUBERCULOSIS",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xff949494),
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                              Text(
                                                "Yes/No",
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xff949494),
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Tuberculosis (T.B)",
                                            result: (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.tuberculossis
                                                            .toString() ??
                                                        "") ==
                                                    "0"
                                                ? "No"
                                                : (admincontroller
                                                                .admingetcasebyid
                                                                .value
                                                                ?.data
                                                                ?.cases
                                                                ?.cvs
                                                                ?.tuberculossis
                                                                .toString() ??
                                                            "") ==
                                                        "1"
                                                    ? "Yes"
                                                    : "",
                                          ),
                                          customcasedetailOtherText(
                                            "Other: ${admincontroller.admingetcasebyid.value?.data?.cases?.cvs?.tuberOthers == null ? "" : admincontroller.admingetcasebyid.value?.data?.cases?.cvs?.tuberOthers.toString() ?? ""}",
                                          ),
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
                                        color: const Color(0xff2E2E2E)
                                            .withOpacity(0.2),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w, vertical: 1.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "REGARDING HEPATITIS",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xff949494),
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                              Text(
                                                "Yes/No",
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xff949494),
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Hepatitis",
                                            result: (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.hepatitis
                                                            .toString() ??
                                                        "") ==
                                                    "0"
                                                ? "No"
                                                : (admincontroller
                                                                .admingetcasebyid
                                                                .value
                                                                ?.data
                                                                ?.cases
                                                                ?.cvs
                                                                ?.hepatitis
                                                                .toString() ??
                                                            "") ==
                                                        "1"
                                                    ? "Yes"
                                                    : "",
                                          ),
                                          customcasedetailOtherText(
                                            "Other: ${admincontroller.admingetcasebyid.value?.data?.cases?.cvs?.hepOthers == null ? "" : admincontroller.admingetcasebyid.value?.data?.cases?.cvs?.hepOthers.toString() ?? ""}",
                                          ),
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
                                        color: const Color(0xff2E2E2E)
                                            .withOpacity(0.2),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w, vertical: 1.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "CIRCULATORY SYSTEM",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xff949494),
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                              Text(
                                                "Yes/No",
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xff949494),
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Anemia",
                                            result: (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.anemia
                                                            .toString() ??
                                                        "") ==
                                                    "0"
                                                ? "No"
                                                : (admincontroller
                                                                .admingetcasebyid
                                                                .value
                                                                ?.data
                                                                ?.cases
                                                                ?.cvs
                                                                ?.anemia
                                                                .toString() ??
                                                            "") ==
                                                        "1"
                                                    ? "Yes"
                                                    : "",
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Bleeding Disorder",
                                            result: (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.bleedingDisorder
                                                            .toString() ??
                                                        "") ==
                                                    "0"
                                                ? "No"
                                                : (admincontroller
                                                                .admingetcasebyid
                                                                .value
                                                                ?.data
                                                                ?.cases
                                                                ?.cvs
                                                                ?.bleedingDisorder
                                                                .toString() ??
                                                            "") ==
                                                        "1"
                                                    ? "Yes"
                                                    : "",
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Clothing Disorder",
                                            result: (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.clothingDisorder
                                                            .toString() ??
                                                        "") ==
                                                    "0"
                                                ? "No"
                                                : (admincontroller
                                                                .admingetcasebyid
                                                                .value
                                                                ?.data
                                                                ?.cases
                                                                ?.cvs
                                                                ?.clothingDisorder
                                                                .toString() ??
                                                            "") ==
                                                        "1"
                                                    ? "Yes"
                                                    : "",
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Leukemia",
                                            result: (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.leukemia
                                                            .toString() ??
                                                        "") ==
                                                    "0"
                                                ? "No"
                                                : (admincontroller
                                                                .admingetcasebyid
                                                                .value
                                                                ?.data
                                                                ?.cases
                                                                ?.cvs
                                                                ?.leukemia
                                                                .toString() ??
                                                            "") ==
                                                        "1"
                                                    ? "Yes"
                                                    : "",
                                          ),
                                          customcasedetailOtherText(
                                            "Other: ${admincontroller.admingetcasebyid.value?.data?.cases?.cvs?.circulatoryOthers == null ? "" : admincontroller.admingetcasebyid.value?.data?.cases?.cvs?.circulatoryOthers.toString() ?? ""}",
                                          ),
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
                                        color: const Color(0xff2E2E2E)
                                            .withOpacity(0.2),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w, vertical: 1.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "URINARY TRACT SYSTEM",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xff949494),
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                              Text(
                                                "Yes/No",
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xff949494),
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          customCaseDetailFormRow(
                                            title: "U.T.I",
                                            result: (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.uti
                                                            .toString() ??
                                                        "") ==
                                                    "0"
                                                ? "No"
                                                : (admincontroller
                                                                .admingetcasebyid
                                                                .value
                                                                ?.data
                                                                ?.cases
                                                                ?.cvs
                                                                ?.uti
                                                                .toString() ??
                                                            "") ==
                                                        "1"
                                                    ? "Yes"
                                                    : "",
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Kidney Failure",
                                            result: (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.kenalFailure
                                                            .toString() ??
                                                        "") ==
                                                    "0"
                                                ? "No"
                                                : (admincontroller
                                                                .admingetcasebyid
                                                                .value
                                                                ?.data
                                                                ?.cases
                                                                ?.cvs
                                                                ?.kenalFailure
                                                                .toString() ??
                                                            "") ==
                                                        "1"
                                                    ? "Yes"
                                                    : "",
                                          ),
                                          customcasedetailOtherText(
                                            "Other: ${admincontroller.admingetcasebyid.value?.data?.cases?.cvs?.urinaryOthers == null ? "" : admincontroller.admingetcasebyid.value?.data?.cases?.cvs?.urinaryOthers.toString() ?? ""}",
                                          ),
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
                                        color: const Color(0xff2E2E2E)
                                            .withOpacity(0.2),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w, vertical: 1.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "ENDOCRINE SYSTEM",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xff949494),
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                              Text(
                                                "Yes/No",
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xff949494),
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Diabetes",
                                            result: (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.diabetes
                                                            ?.toString() ??
                                                        "") ==
                                                    "0"
                                                ? "No"
                                                : (admincontroller
                                                                .admingetcasebyid
                                                                .value
                                                                ?.data
                                                                ?.cases
                                                                ?.cvs
                                                                ?.diabetes
                                                                ?.toString() ??
                                                            "") ==
                                                        "1"
                                                    ? "Yes"
                                                    : admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.diabetes
                                                            ?.toString() ??
                                                        "",
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Hyperparathyroidism",
                                            result: (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.hyperparathyrodism
                                                            ?.toString() ??
                                                        "") ==
                                                    "0"
                                                ? "No"
                                                : (admincontroller
                                                                .admingetcasebyid
                                                                .value
                                                                ?.data
                                                                ?.cases
                                                                ?.cvs
                                                                ?.hyperparathyrodism
                                                                ?.toString() ??
                                                            "") ==
                                                        "1"
                                                    ? "Yes"
                                                    : admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.hyperparathyrodism
                                                            ?.toString() ??
                                                        "",
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Hypothyroidism",
                                            result: (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.hyperthyrodismNew
                                                            ?.toString() ??
                                                        "") ==
                                                    "0"
                                                ? "No"
                                                : (admincontroller
                                                                .admingetcasebyid
                                                                .value
                                                                ?.data
                                                                ?.cases
                                                                ?.cvs
                                                                ?.hyperthyrodismNew
                                                                ?.toString() ??
                                                            "") ==
                                                        "1"
                                                    ? "Yes"
                                                    : admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.hyperthyrodismNew
                                                            ?.toString() ??
                                                        "",
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Hyperthyroidism",
                                            result: (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.hyperthyrodism
                                                            ?.toString() ??
                                                        "") ==
                                                    "0"
                                                ? "No"
                                                : (admincontroller
                                                                .admingetcasebyid
                                                                .value
                                                                ?.data
                                                                ?.cases
                                                                ?.cvs
                                                                ?.hyperthyrodism
                                                                ?.toString() ??
                                                            "") ==
                                                        "1"
                                                    ? "Yes"
                                                    : admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.hyperthyrodism
                                                            ?.toString() ??
                                                        "",
                                          ),
                                          customcasedetailOtherText(
                                            "Other: ${admincontroller.admingetcasebyid.value?.data?.cases?.cvs?.endocrineOthers == null ? "" : admincontroller.admingetcasebyid.value?.data?.cases?.cvs?.endocrineOthers.toString() ?? ""}",
                                          ),
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
                                        color: const Color(0xff2E2E2E)
                                            .withOpacity(0.2),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w, vertical: 1.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "NERVOUS SYSTEM",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xff949494),
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                              Text(
                                                "Yes/No",
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xff949494),
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Seizure",
                                            result: (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.seizure
                                                            ?.toString() ??
                                                        "") ==
                                                    "0"
                                                ? "No"
                                                : (admincontroller
                                                                .admingetcasebyid
                                                                .value
                                                                ?.data
                                                                ?.cases
                                                                ?.cvs
                                                                ?.seizure
                                                                ?.toString() ??
                                                            "") ==
                                                        "1"
                                                    ? "Yes"
                                                    : admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.seizure
                                                            ?.toString() ??
                                                        "",
                                          ),
                                          customCaseDetailFormRow(
                                            title: "Epilepsy",
                                            result: (admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.epilepsy
                                                            ?.toString() ??
                                                        "") ==
                                                    "0"
                                                ? "No"
                                                : (admincontroller
                                                                .admingetcasebyid
                                                                .value
                                                                ?.data
                                                                ?.cases
                                                                ?.cvs
                                                                ?.epilepsy
                                                                ?.toString() ??
                                                            "") ==
                                                        "1"
                                                    ? "Yes"
                                                    : admincontroller
                                                            .admingetcasebyid
                                                            .value
                                                            ?.data
                                                            ?.cases
                                                            ?.cvs
                                                            ?.epilepsy
                                                            ?.toString() ??
                                                        "",
                                          ),
                                          customcasedetailOtherText(
                                            "Other: ${admincontroller.admingetcasebyid.value?.data?.cases?.cvs?.nervousOthers == null ? "" : admincontroller.admingetcasebyid.value?.data?.cases?.cvs?.nervousOthers.toString() ?? ""}",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                        SizedBox(
                          height: 2.h,
                        ),
                        admincontroller.admingetcasebyid.value?.data?.cases
                                    ?.doctor ==
                                null
                            ? custombutton(
                                title: "Assigned to",
                                ontap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(24)),
                                    ),
                                    isScrollControlled: true,
                                    builder: (context) =>
                                        DraggableScrollableSheet(
                                      initialChildSize: 0.5,
                                      minChildSize: 0.3,
                                      maxChildSize: 0.9,
                                      expand: false,
                                      builder: (context, scrollController) {
                                        return ConsultantListBottomSheet(
                                          scrollController: scrollController,
                                          caseguid: admincontroller
                                                  .admingetcasebyid
                                                  .value
                                                  ?.data
                                                  ?.cases
                                                  ?.guid
                                                  .toString() ??
                                              "",
                                        );
                                      },
                                    ),
                                  );
                                  // Get.toNamed(
                                  //     RouteConstants.consultantlistscreen);
                                })
                            : const SizedBox(),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
        )),
      ),
    );
  }
}

////////custom admin case details box
Container customadmincasedetailbox({
  required String title,
  required String subtitle,
}) {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff2E2E2E).withOpacity(0.2)),
        borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: const Color(0xff949494), fontSize: 16.sp),
          ),
          Text(
            subtitle,
            style: TextStyle(color: Colors.black, fontSize: 16.sp),
          ),
        ],
      ),
    ),
  );
}

/////custom case detail other text
Text customcasedetailOtherText(String other) {
  return Text(
    other,
    style: TextStyle(
      color: const Color(0xff000000),
      fontSize: 16.sp,
    ),
  );
}

//////////custom case detail form row
Row customCaseDetailFormRow({
  required String title,
  required String result,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 15.sp),
      ),
      Text(
        result,
        style: TextStyle(color: Colors.black, fontSize: 15.sp),
      ),
    ],
  );
}

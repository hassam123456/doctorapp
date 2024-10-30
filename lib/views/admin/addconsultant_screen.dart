import 'package:doctorapp/components/customcomponents.dart';
import 'package:doctorapp/controller/componentsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddConsutltantScreen extends StatefulWidget {
  const AddConsutltantScreen({super.key});

  @override
  State<AddConsutltantScreen> createState() => _AddConsutltantScreenState();
}

class _AddConsutltantScreenState extends State<AddConsutltantScreen> {
  final componentcontroller = Get.put(ComponentsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customappbar(
        title: "Add Consultants",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "As an admin, you can add new consultants to offer personalized care tailored to the needs of your patients.",
                style: TextStyle(color: Color(0xff949494), fontSize: 15.sp),
              ),
              SizedBox(
                height: 3.h,
              ),
              customtextformfield(lable: "Full Name"),
              SizedBox(
                height: 2.h,
              ),
              customtextformfield(lable: "Clinic/Hospital Name"),
              SizedBox(
                height: 2.h,
              ),
              customtextformfield(lable: "Email Address"),
              SizedBox(
                height: 2.h,
              ),
              customnumbertextformfield(lable: "Phone Number"),
              SizedBox(
                height: 2.h,
              ),
              customtextformfield(lable: "Address"),
              SizedBox(
                height: 2.h,
              ),
              customtextformfield(lable: "Medical License Number"),
              SizedBox(
                height: 2.h,
              ),
              customtextformfield(lable: "Specialization"),
              SizedBox(
                height: 2.h,
              ),
              customtextformfield(lable: "Years of Experience"),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => TextFormField(
                  obscureText: componentcontroller.addconsultantpasssword.value
                      ? false
                      : true,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          componentcontroller.updateaddconsultantpasssword();
                        },
                        child: Icon(
                            componentcontroller.addconsultantpasssword.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color:
                                  const Color(0xff2E2E2E).withOpacity(0.02))),
                      labelText: "Password"),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => TextFormField(
                  obscureText:
                      componentcontroller.addconsultantconfpasssword.value
                          ? false
                          : true,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          componentcontroller
                              .updateaddconsultantconfpasssword();
                        },
                        child: Icon(
                            componentcontroller.addconsultantconfpasssword.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color:
                                  const Color(0xff2E2E2E).withOpacity(0.02))),
                      labelText: "Confirm"),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              custombutton(
                  title: "Add Personalized Consultant",
                  ontap: () {
                    Get.back();
                  }),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

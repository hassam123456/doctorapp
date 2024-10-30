import 'package:doctorapp/components/customcomponents.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdminUploadVideoScreen extends StatefulWidget {
  const AdminUploadVideoScreen({super.key});

  @override
  State<AdminUploadVideoScreen> createState() => _AdminUploadVideoScreenState();
}

class _AdminUploadVideoScreenState extends State<AdminUploadVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customappbar(title: "Upload Video"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "As an admin, you can add new Videos to offer personalized care information to the needs of your patients.",
                style: TextStyle(color: Color(0xff949494), fontSize: 15.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              customtextformfield(lable: "Title"),
              SizedBox(
                height: 2.h,
              ),
              customtextformfield(lable: "Category"),
              SizedBox(
                height: 2.h,
              ),
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: const Color(0xff2E2E2E).withOpacity(0.02))),
                    labelText: "Description"),
              ),
              SizedBox(
                height: 2.h,
              ),
              customtextformfield(lable: "URL"),
              SizedBox(
                height: 2.h,
              ),
              custombutton(title: "Add E-Book", ontap: () {}),
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

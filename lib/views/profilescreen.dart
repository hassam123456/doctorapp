import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _profileImage;
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20.sp),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Your profile details have been set by the admin.",
              style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 2.h),

            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : AssetImage("assets/images/default_profile.png")
                            as ImageProvider,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),

            // Profile details
            _buildProfileField("Full Name", "Dr. Sarah Johnson"),
            _buildProfileField("Clinic/Hospital Name", "Heart Care Clinic"),
            _buildProfileField("Email Address", "dr.sarah.johnson@gmail.com"),
            _buildProfileField("Phone Number", "(555) 123-4567"),
            _buildProfileField(
                "Address", "1234 Wellness Ave, Suite 101, Cityville, ST 56789"),
            _buildProfileField("Medical License Number", "ABC12345678"),
            _buildProfileField("Specialization", "Cardiologist"),
            _buildProfileField("Years of Experience", "10 years"),
          ],
        ),
      ),
    );
  }

  // Method to build each profile field
  Widget _buildProfileField(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: TextFormField(
        // readOnly: true,
        // initialValue: value,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
        ),
      ),
    );
  }
}

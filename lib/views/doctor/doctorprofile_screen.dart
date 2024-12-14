import 'dart:io';
import 'package:doctorapp/components/customcomponents.dart';
import 'package:doctorapp/controller/adminController.dart';
import 'package:doctorapp/controller/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class DoctorProfileScreen extends StatefulWidget {
  @override
  _DoctorProfileScreenState createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.put(AuthController(authRepo: Get.find()));
  final storecontroller = Get.put(AdminController(adminRepo: Get.find()));
  @override
  void initState() {
    super.initState();
    controller.getprofiledata();
    controller.profilenamecontroller.value.clear();
    controller.profilelastnamecontroller.value.clear();
    controller.profileemailcontroller.value.clear();
    controller.profilephonecontroller.value.clear();
    // storecontroller.searchController.clear();
  }

  // bool _isObscure = true; // For password visibility
  // bool _isConfirmObscure = true; // For confirm password visibilityur default country here
  // bool _isObscure2 = true;
  final List<String> countries = [
    'Poland',
    'Argentina',
    'Brazil',
    'Botswana',
  ];
  // File? uploadedProfileImage;
  Future<void> uploadImage() async {
    final picker = ImagePicker();
    final pickedImage = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Image Source"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text("Gallery"),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.gallery);
                  },
                ),
                SizedBox(height: 20),
                GestureDetector(
                  child: Text("Camera"),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
    if (pickedImage != null) {
      final pickedFile = await picker.pickImage(source: pickedImage);
      if (pickedFile != null) {
        setState(() {
          controller.uploadedProfileImage = File(pickedFile.path);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent, // Transparent background
        elevation: 0.0, // Remove shadow
        title: Text(
          'User Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Colors.black,
          ),
        ),
        // leading: Padding(
        //   padding: const EdgeInsets.only(top: 10.0, right: 15),
        //   child: GestureDetector(
        //     onTap: () => Navigator.pop(context),
        //     child: Icon(Icons.arrow_back),
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              final profile = controller.profiledatalist.value?.data?.profile;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  _buildInputField(
                    label: "Name",
                    controller: controller.profilenamecontroller.value,
                    hintText: profile?.name ?? 'Enter your name',
                    // validator: _validateName,
                  ),
                  const SizedBox(height: 20),

                  // Hospital Name
                  _buildInputField(
                    label: "Hospital Name",
                    controller: controller.profilehospitalnamecontroller.value,
                    hintText: profile?.hospitalName ?? 'Enter hospital name',
                  ),
                  const SizedBox(height: 20),

                  // Address
                  _buildInputField(
                    label: "Address",
                    controller: controller.addressController.value,
                    hintText: profile?.address ?? 'Enter address',
                  ),
                  const SizedBox(height: 20),

                  // License Number
                  _buildInputField(
                    label: "License Number",
                    controller: controller.licenseController.value,
                    hintText: profile?.licenseNumber ?? 'Enter license number',
                    // validator: _validateRequiredField,
                  ),
                  const SizedBox(height: 20),

                  // Specialization
                  _buildInputField(
                    label: "Specialization",
                    controller: controller.specializationController.value,
                    hintText: profile?.specialization ?? 'Enter specialization',
                    // validator: _validateRequiredField,
                  ),
                  const SizedBox(height: 20),

                  // Experience
                  _buildInputField(
                    label: "Experience (Years)",
                    controller: controller.experienceController.value,
                    hintText: profile?.experience ?? 'Enter experience',
                    keyboardType: TextInputType.number,
                    // validator: _validateNumberField,
                  ),
                  const SizedBox(height: 20),

                  // Phone Number
                  _buildInputField(
                    label: "Phone Number",
                    controller: controller.profilephonecontroller.value,
                    hintText: profile?.phoneNumber ?? 'Enter phone number',
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  const SizedBox(height: 20),

                  // Submit Button
                  controller.upprofiledataloading.value
                      ? const Center(child: CircularProgressIndicator())
                      : custombutton(
                          title: 'Done',
                          ontap: () {
                            if (_formKey.currentState!.validate()) {
                              controller.updateprofiledata();
                            }
                          },
                        ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  /// Helper method to create input fields
  Widget _buildInputField({
    required String label,
    required TextEditingController? controller,
    required String hintText,
    bool enabled = true,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          enabled: enabled,
          keyboardType: keyboardType,
          validator: validator,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffDBDBDB)),
              borderRadius: BorderRadius.circular(15.0),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }

  /// Validators
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return "Only letters and spaces are allowed";
    }
    return null;
  }

  String? _validateRequiredField(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  String? _validateNumberField(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return "Only numbers are allowed";
    }
    return null;
  }
}

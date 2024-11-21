import 'package:doctorapp/components/errordailog.dart';
import 'package:doctorapp/constants/appcolors.dart';
import 'package:doctorapp/constants/appconstant.dart';
// import 'package:doctorapp/constants/appconstant.dart';
import 'package:doctorapp/controller/adminController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class EBookListScreen extends StatefulWidget {
  @override
  State<EBookListScreen> createState() => _EBookListScreenState();
}

class _EBookListScreenState extends State<EBookListScreen> {
  final admincontroller = Get.put(AdminController(adminRepo: Get.find()));

  @override
  void initState() {
    super.initState();
    admincontroller.getebookdata();
  }

  Future<void> _launchURL(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url); // Attempt to launch the URL
      } else {
        showErrrorSnackbar(message: "Could not launch URL. Please try again.");
      }
    } catch (e) {
      showErrrorSnackbar(message: "Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Books"),
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
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: Color.fromARGB(255, 128, 128, 128)),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10.0, right: 18.0),
                child: Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                    Expanded(
                      child: TextFormField(
                        controller: admincontroller.ebooksearchcontroller.value,
                        decoration: InputDecoration(
                          hintText: "Search Any Item",
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          admincontroller.getproductssearchbykey(
                              value); // Update search results dynamically
                        },
                      ),
                    ),
                    admincontroller.ebooksearchcontroller.value.text.isEmpty
                        ? SizedBox()
                        : GestureDetector(
                            onTap: () {
                              admincontroller.getproductssearchbykey(
                                  admincontroller
                                      .ebooksearchcontroller.value.text);
                            },
                            child: Icon(Icons.search),
                          ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 2.h),
            // Use GetBuilder to rebuild the list when the state is updated
            Expanded(
              child: GetBuilder<AdminController>(
                builder: (controller) {
                  final searchKey = controller.ebooksearchcontroller.value.text;
                  final ebookList = searchKey.isNotEmpty
                      ? controller.productbyserachkey.value?.data?.ebooks ?? []
                      : controller.ebookdata.value?.data?.ebooks ?? [];

                  if (ebookList.isEmpty) {
                    return Center(child: Text("No eBooks found"));
                  }

                  return ListView.builder(
                    itemCount: ebookList.length,
                    itemBuilder: (context, index) {
                      final ebook = ebookList[index];
                      return GestureDetector(
                        onTap: () async {
                          // Launch the URL when the card is tapped
                          await _launchURL(ebook.url.toString());
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: EdgeInsets.only(bottom: 2.h),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 90,
                                  width: 80,
                                  child: Image.network(
                                    (ebook.media == null ||
                                            ebook.media!.isEmpty ||
                                            ebook.media![0].originalUrl ==
                                                null ||
                                            ebook
                                                .media![0].originalUrl!.isEmpty)
                                        ? AppConstants
                                            .noimage // Placeholder image for no media or empty URL
                                        : ebook.media![0].originalUrl
                                            .toString(),
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ebook.title.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      SizedBox(height: 1.h),
                                      Text(
                                        ebook.category.toString(),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                      SizedBox(height: 1.h),
                                      Text(
                                        ebook.description.toString(),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.grey[700],
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 1.h),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          "Read Now!",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:doctorapp/constants/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VideoListScreen extends StatelessWidget {
  final List<Map<String, String>> ebooks = [
    {
      'title': 'The Doctor By Annie Payne',
      'description':
          'A glimpse into the personal lives of doctors, showing how they balance work and family life, and the emotional and psychological toll their profession can take on them.',
      'image': 'assets/images/video1.png',
    },
    {
      'title': 'The Healing Touch: A Doctor’s Journey Through Medicine.',
      'description':
          'This eBook explores the personal and professional growth of a physician, highlighting the challenges and rewards of medical...',
      'image': 'assets/images/book2.png',
    },
    {
      'title': 'Mind Over Medicine.',
      'description':
          'Focusing on the connection between mental health and physical health, this eBook discusses how doctors can integrate mental wellness strategies into their practice for holistic patient care.',
      'image': 'assets/images/video2.png',
    },
    {
      'title': 'Behind the Stethoscope',
      'description':
          'This eBook discusses how doctors can integrate mental wellness strategies into their practice for holistic patient care.',
      'image': 'assets/images/video3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Dental Video Library"),
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
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 2.h),
            Expanded(
              child: ListView.builder(
                itemCount: ebooks.length,
                itemBuilder: (context, index) {
                  final ebook = ebooks[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.only(bottom: 2.h),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            ebook['image']!,
                            width: 20.w,
                            height: 15.h,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ebook['title']!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.sp,
                                      color: AppColors.primaryColor),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  ebook['description']!,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.grey[700],
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 1.h),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "Watch Now!",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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

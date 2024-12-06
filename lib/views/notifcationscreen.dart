import 'package:doctorapp/controller/adminController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final AdminController homecontroller = Get.put(
    AdminController(adminRepo: Get.find()),
  );

  @override
  void initState() {
    super.initState();
    homecontroller.getnotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Obx(() {
        if (homecontroller.getnotificationdatloading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (homecontroller
            .getnotificationdata.value!.data.notifications.isEmpty) {
          return Center(
            child: Text("No notifications available."),
          );
        } else {
          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: homecontroller
                .getnotificationdata.value!.data.notifications.length,
            itemBuilder: (context, index) {
              final notification = homecontroller
                  .getnotificationdata.value!.data.notifications[index];
              return NotificationCard(
                // icon: ,
                title: notification.title,
                description: notification.message,
                time: "10:00",
                backgroundColor: Color.fromARGB(255, 241, 240, 240),
              );
            },
          );
        }
      }),
    );
  }
}

class NotificationCard extends StatelessWidget {
  // final IconData icon;
  final String title;
  final String description;
  final String time;
  final Color backgroundColor;

  NotificationCard({
    // required this.icon,
    required this.title,
    required this.description,
    required this.time,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.notification_add, color: Colors.green),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 8),
            Text(
              time,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(description),
            SizedBox(height: 4),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
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
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          NotificationCard(
            icon: Icons.check_circle,
            title: 'Login Success!',
            description: 'Congratulations! You have successfully logged in.',
            time: '9:56 AM',
            backgroundColor: Colors.green[100]!,
          ),
          NotificationCard(
            icon: Icons.file_upload,
            title: 'Case Uploaded!',
            description: 'A new case has been uploaded by Dr. Lisa.',
            time: '9:56 AM',
            backgroundColor: Colors.white,
          ),
          NotificationCard(
            icon: Icons.person_add,
            title: 'Personalized Consultant Created',
            description: 'You have successfully created personalized...',
            time: '9:56 AM',
            backgroundColor: Colors.white,
          ),
          NotificationCard(
            icon: Icons.person,
            title: 'Personalized Consultant Assigned',
            description: 'You have successfully assigned Dr. Emily...',
            time: '9:56 AM',
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String time;
  final Color backgroundColor;

  NotificationCard({
    required this.icon,
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
          child: Icon(icon, color: Colors.green),
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

import 'package:doctorapp/views/doctor/doctorHomeScreen.dart';
import 'package:doctorapp/views/doctor/doctorprofile_screen.dart';
import 'package:doctorapp/views/notifcationscreen.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';

class DoctorBottomNavBar extends StatefulWidget {
  @override
  _DoctorBottomNavBarState createState() => _DoctorBottomNavBarState();
}

class _DoctorBottomNavBarState extends State<DoctorBottomNavBar> {
  int _currentIndex = 1; // Start with Home in the middle

  final List<Widget> _tabs = [
    DoctorProfileScreen(),
    DoctorHomeScreen(),
    NotificationScreen()
  ];

  final List<IconData> _icons = [
    Icons.person_2_outlined,
    Icons.home_filled,
    Icons.notifications,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: MotionTabBar(
        labels: const ["Profile", "Home", "Notifications"],
        initialSelectedTab: "Home",
        tabIconColor: const Color(0xff848A94),
        tabSelectedColor: const Color(0xff34A853),
        icons: _icons,
        onTabItemSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

import 'package:doctorapp/views/notifcationscreen.dart';
import 'package:doctorapp/views/user/userhomescreen.dart';
import 'package:doctorapp/views/user/userprofileScreen.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';

class UserBottomNavBar extends StatefulWidget {
  @override
  _UserBottomNavBarState createState() => _UserBottomNavBarState();
}

class _UserBottomNavBarState extends State<UserBottomNavBar> {
  int _currentIndex = 1;

  final List<Widget> _tabs = [
    UserProfileScreen(),
    UserHomeScreen(),
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

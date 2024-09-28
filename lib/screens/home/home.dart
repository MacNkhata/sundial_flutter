import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:sundial/models/user.dart';
import 'package:sundial/screens/nav/dashboard.dart';
import 'package:sundial/screens/nav/profile.dart';

import '../nav/homepage.dart';

class HomeScreen extends StatefulWidget {
  final User? user;
  final List<dynamic>? workouts;
  const HomeScreen({super.key, this.user, this.workouts});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var user = widget.user;
    var workouts = widget.workouts;

    List<Widget> pages = <Widget>[
      Homepage(user: user, workouts: workouts),
      const DashboardScreen(),
      const ProfileScreen()
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF06141B),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0D2835),
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedFontSize: 16.0,
        unselectedFontSize: 14.0,
        unselectedItemColor: const Color(0xFFF0F0F0),
        selectedItemColor: const Color(0XFFF45050),
        currentIndex: currentPageIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: HugeIcon(
                icon: HugeIcons.strokeRoundedHome01, color: Color(0XFFF45050)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedAnalytics01,
                color: Color(0XFFF45050),
              ),
              label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedUser,
                color: Color(0XFFF45050),
              ),
              label: 'Profile'),
        ],
      ),
      body: pages[currentPageIndex],
    );
  }
}

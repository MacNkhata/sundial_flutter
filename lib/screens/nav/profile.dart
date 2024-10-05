import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sundial/screens/auth/login.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF06141B),
        title: const Text(
          "Profile",
          style: TextStyle(color: Color(0xFFF0F0F0)),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF06141B),
      body: SafeArea(
        child: TextButton.icon(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.remove('jwt');
            await prefs.remove('userId');

            await Future.delayed(const Duration(seconds: 2));

            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => const LoginScreen()),
                (Route route) => false);
          },
          icon: const Icon(
            Icons.logout,
            color: Color(0XFFF45050),
          ),
          label: const Text(
            "Logout",
            style: TextStyle(color: Color(0xFFF0F0F0), fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}

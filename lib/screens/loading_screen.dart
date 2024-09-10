import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sundial/screens/home/home.dart';
import 'package:sundial/screens/onboarding/onboarding.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool isFirstRun = true;

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstRun = prefs.getBool('onboarding_completed') ?? false;

    if (isFirstRun) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const String title = 'Sundial';
    return MaterialApp(
      title: title,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: Scaffold(
        backgroundColor: const Color(0xFF06141B),
        body: SafeArea(
            child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/loading_bg.png'),
                fit: BoxFit.fitWidth),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 120,
                    height: 122.64,
                    fit: BoxFit.cover,
                  ),
                ),
                const Spacer(),
                Text(
                  'Let\'s \nburn some fat.',
                  // textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 42.0,
                      color: Colors.white,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                Text(
                  'We both know you kinda fat so leave the bullshitting aside let\'s get in shape.',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 16.0,
                          color: Colors.white)),
                ),
                const Spacer(),
                Center(
                  child: LoadingAnimationWidget.inkDrop(
                      color: const Color(0XFFF45050), size: 42),
                ),
                const Spacer(),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

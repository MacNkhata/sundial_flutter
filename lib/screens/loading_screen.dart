import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(const Duration(minutes: 5));
    if (mounted) {
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    const String title = 'Sundial';
    return MaterialApp(
      title: title,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.fromLTRB(16, 16, 16, 0)),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 120,
                  height: 122.64,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'Let\'s burn some fat.',
                style: GoogleFonts.poppins(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

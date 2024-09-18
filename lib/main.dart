import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sundial/screens/loading_screen.dart';

Future<void> main() async {
  // Loading .env file
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sundial',
      home: LoadingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

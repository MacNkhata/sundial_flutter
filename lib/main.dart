import 'package:flutter/material.dart';
import 'package:sundial/screens/home_screen.dart';
import 'package:sundial/screens/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sundial',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(6, 20, 27, 1)),
        useMaterial3: true,
      ),
      home: const LoadingScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

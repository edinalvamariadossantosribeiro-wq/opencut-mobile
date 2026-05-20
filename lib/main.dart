import 'package:flutter/material.dart';
import 'package:opencut_mobile/screens/home_screen.dart';

void main() {
  runApp(const OpenCutApp());
}

class OpenCutApp extends StatelessWidget {
  const OpenCutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenCut',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: const Color(0xFF0F0F0F),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0F0F0F),
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

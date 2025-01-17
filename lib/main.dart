import 'package:flutter/material.dart';
import 'package:images_json/config/theme.dart';
import 'package:images_json/views/pages/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const HomeScreen());
  }
}

import 'package:flutter/material.dart';
import 'package:gemini_math/pages/home_page.dart';
import 'package:gemini_math/constants/colors.dart';

void main() async {
  runApp(const GeminiApp());
}

class GeminiApp extends StatelessWidget {
  const GeminiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GeminiMath',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MainColor.primaryColor),
        useMaterial3: false,
      ),
      home: const MyHomePage(),
    );
  }
}
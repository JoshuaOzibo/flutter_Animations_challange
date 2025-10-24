import 'package:flutter/material.dart';
import 'package:flutter_animations/features/challange_one/home_screen/home_screen.dart';
import 'package:flutter_animations/features/challange_one/login_screen/login_screen.dart';
import 'package:flutter_animations/features/challange_one/onboarding_screens/onboarding_screen.dart';
import 'package:flutter_animations/features/challange_one/splash_screen/splash_screen.dart';
import 'package:flutter_animations/features/challange_two/cake/cake_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: CakeHomePage());
  }
}

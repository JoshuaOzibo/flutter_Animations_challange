import 'package:flutter/material.dart';
import 'package:flutter_animations/features/challange_one/onboarding_screens/onboarding_one.dart';
import 'package:flutter_animations/features/challange_one/splash_screen/splash_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        builder: (context, child) { // SplashScreen();
          return OnboardingOne();
        },
    );
  }
}
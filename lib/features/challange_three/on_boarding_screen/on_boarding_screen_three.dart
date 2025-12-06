import 'package:flutter/material.dart';

class OnBoardingScreenThree extends StatefulWidget {
  const OnBoardingScreenThree({super.key});

  @override
  State<OnBoardingScreenThree> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreenThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 64, 21, 6),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromARGB(255, 234, 147, 48),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 234, 147, 48),
                ),
                child: Text('Hello'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(right: 100),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromARGB(255, 234, 147, 48),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

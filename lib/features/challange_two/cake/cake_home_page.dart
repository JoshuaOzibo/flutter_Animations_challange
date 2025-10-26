import 'package:flutter/material.dart';

class CakeHomePage extends StatefulWidget {
  const CakeHomePage({super.key});

  @override
  State<CakeHomePage> createState() => _CakeHomePageState();
}

class _CakeHomePageState extends State<CakeHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        mainAxisSize: MainAxisSize.max,
      )),
    );
  }
  
}
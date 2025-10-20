import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 62, 169),
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(1.2, -1.2),
            child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-1.4, -0.7),
            child: Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.8, 1.1),
            child: Container(
              height: 120,
              width: 120,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(18))
                  ),
                  child: const Icon(Icons.access_alarm, size: 40,),
                ),
                const SizedBox(height: 20),
                const Text('Fry', style: TextStyle(
                  fontSize: 30, 
                  color: Colors.white,

                ),),
                const SizedBox(height: 15),
                const Text('Beauty Appointment UI Kit', style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

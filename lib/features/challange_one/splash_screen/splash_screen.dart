import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animations/features/challange_one/onboarding_screens/onboarding_screen.dart';
import 'package:flutter_animations/features/challange_one/page_animation/animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController scaleController;
  late AnimationController listAnimationController;
  late Animation<double> scaleAnimation;
  late Animation<Offset> circleSlideAnimation;
  late Animation<Offset> circleTwoSlideAnimation;
  late Animation<Offset> circleThreeSlideAnimation;
  late List<Animation<Offset>> listAnimation;
  bool isAnimationCompleted = false;
  bool isListAnimationCompleted = false;

  List<String> splashText = ['Fry', 'Beauty Appointment UI Kit'];

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    listAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    circleSlideAnimation = Tween<Offset>(
      begin: Offset(0, -0.05),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));

    circleTwoSlideAnimation = Tween<Offset>(
      begin: Offset(-0.18, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));

    circleThreeSlideAnimation = Tween<Offset>(
      begin: Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));

    scaleAnimation = Tween<double>(begin: 0.6, end: 1.3).animate(
      CurvedAnimation(parent: scaleController, curve: Curves.bounceOut),
    );

    listAnimation = List.generate(
      2,
      (index) => Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(
        CurvedAnimation(
          parent: listAnimationController,
          curve: Interval(index * (1 / 2), 1),
        ),
      ),
    );

    controller.forward();
    scaleController.forward();

    scaleController.addListener(() {
      if (scaleAnimation.isCompleted) {
        setState(() {
          isAnimationCompleted = true;
          listAnimationController.forward();
        });
      }
    });

    listAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isListAnimationCompleted = true;
        });
        Timer(const Duration(milliseconds: 1000), () {
          Navigator.push(context, PagesAnimation(route: OnboardingScreen()));
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    scaleController.dispose();
    listAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 62, 169),
      body: Stack(
        children: [
          SlideTransition(
            position: circleSlideAnimation,
            child: Align(
              alignment: const Alignment(1.2, -1.2),
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 41, 100, 202),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          SlideTransition(
            position: circleTwoSlideAnimation,
            child: Align(
              alignment: const Alignment(-1.4, -0.7),
              child: Container(
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 41, 100, 202),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          SlideTransition(
            position: circleThreeSlideAnimation,
            child: Align(
              alignment: const Alignment(0.8, 1.1),
              child: Container(
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 41, 100, 202),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ScaleTransition(
                  scale: scaleAnimation,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: isAnimationCompleted ? 1 : 0.5,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      child: const Icon(Icons.access_alarm, size: 40),
                    ),
                  ),
                ),

                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: splashText.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Center(
                        child: SlideTransition(
                          position: listAnimation[index],
                          child: AnimatedOpacity(
                            opacity: isAnimationCompleted ? 1 : 0,
                            duration: const Duration(milliseconds: 1000),
                            child: Text(
                              splashText[index],
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                if (isListAnimationCompleted)
                  CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

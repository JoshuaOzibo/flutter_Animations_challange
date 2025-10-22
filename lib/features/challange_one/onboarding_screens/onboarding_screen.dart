import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animations/features/challange_one/login_screen/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingOneState();
}

class _OnboardingOneState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final onboardingItems = OnboardingData.boardingData;

    return Scaffold(
      body: Stack(
        children: [
          // PageView for smooth horizontal swiping
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingItems.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final item = onboardingItems[index];

              return Stack(
                children: [
                  // Background image
                  Image.asset(
                    item['image']!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),

                  // Blurred + dark gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.8),
                        ],
                        stops: const [0.3, 1.0],
                      ),
                    ),
                  ),

                  // Optional blur layer for soft focus
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(color: Colors.black.withOpacity(0.3)),
                  ),

                  // Skip button
                  Positioned(
                    top: 50,
                    right: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  // Main text content
                  Positioned(
                    bottom: 220,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['heading']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          item['paragraph']!,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 15,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          // Dots Indicator
          Positioned(
            bottom: 130,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(onboardingItems.length, (dotIndex) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentIndex == dotIndex ? 24 : 12,
                  height: 3,
                  decoration: BoxDecoration(
                    color: _currentIndex == dotIndex
                        ? Colors.white
                        : Colors.white54,
                    borderRadius: BorderRadius.circular(50),
                  ),
                );
              }),
            ),
          ),

          // Buttons
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Expanded(
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentIndex < onboardingItems.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                                  return LoginScreen();
                                },
                            transitionsBuilder:
                                (
                                  context,
                                  animation,
                                  secondaryAnimation,
                                  child,
                                ) {
                                  final slideAnimation =
                                      Tween<Offset>(
                                        begin: Offset(1, 0),
                                        end: Offset.zero,
                                      ).animate(
                                        CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.easeOut,
                                        ),
                                      );
                                  return SlideTransition(
                                    position: slideAnimation,
                                    child: child,
                                  );
                                },

                            transitionDuration: const Duration(
                              milliseconds: 1000,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      _currentIndex == onboardingItems.length - 1
                          ? 'Finish'
                          : 'Continue',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingData {
  static List<Map<String, String>> boardingData = [
    {
      "heading": "Luxury Beauty Redefined",
      "paragraph":
          "Experience the finest in beauty craftsmanship with our curated selection of premium services and world-class professionals.",
      "image": 'images/cow_image.png',
    },
    {
      "heading": "Empower Your Natural Beauty",
      "paragraph":
          "Unlock your inner confidence with treatments designed to rejuvenate, refresh, and enhance your natural glow.",
      "image": 'images/cow_image.png',
    },
    {
      "heading": "Your Beauty, Our Passion",
      "paragraph":
          "Join our family of satisfied clients and let our professionals craft the perfect look, just for you.",
      "image": 'images/cow_image.png',
    },
  ];
}

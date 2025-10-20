import 'package:flutter/material.dart';

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/cow_image.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.darken,
          ),

          // Blurred + dark gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(1)],
                stops: const [0.1, 1.0],
              ),
            ),
          ),

          Positioned(
            bottom: 150,
            left: 0,
            right: 0,
            child: 
              Row(
                spacing: 5,
                children: [
                  Container(
                    width: 20,
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ],
              )
            ),

          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                spacing: 20,
                children: [
                  Expanded(
                    child: MaterialButton(
                      height: 50,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),

                  Expanded(
                    child: MaterialButton(
                      height: 50,
                      color: Colors.blue,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
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
      "id": "1",
      "heading": "Luxury Beauty Redefined",
      "paragraph":
          "Experiance the finest in beauty craftmanship with our curated selection of premium services and world-class professionals",
      "image": 'assets/images/cowImage.png',
    },
    {
      "id": "2",
      "heading": "Luxury Beauty Redefined",
      "paragraph":
          "Experiance the finest in beauty craftmanship with our curated selection of premium services and world-class professionals",
      "image": 'assets/images/cowImage.png',
    },
    {
      "id": "3",
      "heading": "Luxury Beauty Redefined",
      "paragraph":
          "Experiance the finest in beauty craftmanship with our curated selection of premium services and world-class professionals",
      "image": 'assets/images/cowImage.png',
    },
  ];
}

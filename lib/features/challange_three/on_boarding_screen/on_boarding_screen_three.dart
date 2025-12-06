import 'package:flutter/material.dart';

class OnBoardingScreenThree extends StatefulWidget {
  const OnBoardingScreenThree({super.key});

  @override
  State<OnBoardingScreenThree> createState() => _OnBoardingScreenThreeState();
}

class _OnBoardingScreenThreeState extends State<OnBoardingScreenThree> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [PageOne(), PageTwo(), PageThree()];

    return Scaffold(
      backgroundColor: Colors.brown,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('Hello'),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: pages.length,
                allowImplicitScrolling: true,
                itemBuilder: (_, index) {
                  return pages[index];
                },
              ),
            ),
            Text('Hello'),
          ],
        ),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

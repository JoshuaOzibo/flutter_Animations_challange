import 'package:flutter/material.dart';

class OnBoardingScreenThree extends StatefulWidget {
  const OnBoardingScreenThree({super.key});

  @override
  State<OnBoardingScreenThree> createState() => _OnBoardingScreenThreeState();
}

class _OnBoardingScreenThreeState extends State<OnBoardingScreenThree> {
  final pageController = PageController();
  List<Widget> pages = [PageOne(), PageTwo(), PageThree()];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    print('currentPage: $currentPage');
    return Scaffold(
      backgroundColor: Colors.brown,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Hello'),
              SizedBox(height: 30),
              Expanded(
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                    // print(currentPage);
                    // print(value);
                  },
                  controller: pageController,
                  itemCount: pages.length,
                  allowImplicitScrolling: true,
                  itemBuilder: (_, index) {
                    return pages[index];
                  },
                ),
              ),
              SizedBox(height: 30),
              MaterialButton(
                hoverElevation: 0,
                color: const Color.fromARGB(255, 73, 41, 30),
                padding: EdgeInsets.symmetric(vertical: 12),
                minWidth: double.infinity,
                child: Text(
                  currentPage == pages.length - 1 ? 'Get started' : 'Continue',
                ),
                onPressed: () {
                  if (currentPage == pages.length - 1) {
                    print('Hello');
                  } else {
                    pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
              ),
            ],
          ),
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

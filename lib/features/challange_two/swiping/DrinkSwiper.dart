import 'package:flutter/material.dart';
import 'dart:math' as math;

class DrinkSwiper extends StatefulWidget {
  @override
  _DrinkSwiperState createState() => _DrinkSwiperState();
}

class _DrinkSwiperState extends State<DrinkSwiper> {
  final PageController _controller = PageController(viewportFraction: 0.75);

  final drinks = [
    {
      "image": "images/cakes_images/cup_cake_one.webp",
      "name": "Cosmoberry",
      "price": "10.00",
      "bgColor": const Color.fromARGB(255, 219, 49, 106),
    },
    {
      "image": "images/cakes_images/cup_cake_two.webp",
      "name": "Mango Swirl",
      "price": "12.00",
      "bgColor": const Color.fromARGB(255, 33, 168, 231),
    },
    {
      "image": "images/cakes_images/cup_cake_three.webp",
      "name": "Berry Blast",
      "price": "11.00",
      "bgColor": const Color.fromARGB(255, 149, 77, 50),
    },
    {
      "image": "images/cakes_images/cup_cake_four.webp",
      "name": "Pink Goddess",
      "price": "13.00",
      "bgColor": Colors.pinkAccent,
    },
    {
      "image": "images/cakes_images/cup_cake_five.webp",
      "name": "Tropical Twist",
      "price": "14.00",
      "bgColor": Colors.deepPurpleAccent,
    },
    {
      "image": "images/cakes_images/cup_cake_six.webp",
      "name": "Red Twist",
      "price": "14.00",
      "bgColor": Colors.redAccent,
    },
    {
      "image": "images/cakes_images/cup_cake_seven.webp",
      "name": "Brown Twist",
      "price": "14.00",
      "bgColor": const Color.fromARGB(255, 237, 135, 98),
    },
  ];

  late Color backgroundColor;

  @override
  void initState() {
    super.initState();
    backgroundColor = drinks[0]["bgColor"] as Color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Gradient.lerp(
              LinearGradient(
                colors: [backgroundColor.withOpacity(0.7), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              LinearGradient(
                colors: [backgroundColor.withOpacity(0.4), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              0.5,
            )!.colors.first,
          ),
          PageView.builder(
            controller: _controller,
            itemCount: drinks.length,
            onPageChanged: (index) {
              setState(() {
                backgroundColor = drinks[index]["bgColor"] as Color;
              });
            },
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  double value = 1.0;

                  if (_controller.position.haveDimensions) {
                    value = (_controller.page! - index);
                    value = (1 - (value.abs() * 0.9)).clamp(0.0, 1.0);
                  }

                  double pageOffset = 0.0;
                  if (_controller.position.haveDimensions) {
                    pageOffset = _controller.page! - index;
                  }

                  return Center(
                    child: DrinkCard(
                      data: drinks[index],
                      scale: value,
                      pageOffset: pageOffset,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class DrinkCard extends StatelessWidget {
  final Map data;
  final double scale;
  final double pageOffset;

  DrinkCard({
    required this.data,
    required this.scale,
    required this.pageOffset,
  });

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((pageOffset.abs() - 0.5), 2) / 0.08));

    return SizedBox.expand(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Transform.scale(
              scale: scale,
              child: Transform.translate(
                offset: Offset(0, 120),
                child: Container(
                  width: 160,
                  height: 40,
                  decoration: BoxDecoration(
                    color: data["bgColor"].withOpacity(0.2),
                    borderRadius: BorderRadius.all(Radius.elliptical(160, 40)),
                    boxShadow: [
                      BoxShadow(
                        color: data["bgColor"].withOpacity(0.4),
                        blurRadius: 35,
                        spreadRadius: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Transform.scale(
              scale: scale,
              child: Image.asset(data["image"], height: 280),
            ),
          ),

          // Name
          Positioned(
            bottom: 90,
            left: 20,
            child: Transform.translate(
              offset: Offset(-pageOffset * 300, 0),
              child: Opacity(
                opacity: (1 - pageOffset.abs()).clamp(0.0, 1.0),
                child: Text(
                  data["name"],
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: data["bgColor"],
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 25,
            left: 20,
            right: 20,
            child: Transform.translate(
              offset: Offset(0, 100 * pageOffset.abs()),
              child: Opacity(
                opacity: (1 - 2 * pageOffset.abs()).clamp(0.0, 1.0),
                child: Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    border: Border.all(color: data["bgColor"]),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      "\$${data['price']} EACH — BUY 1 GET 1 FREE",
                      style: TextStyle(
                        color: data["bgColor"],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

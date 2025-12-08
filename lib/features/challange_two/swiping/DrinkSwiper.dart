import 'package:flutter/material.dart';

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
      "bgColor": Colors.purple,
    },
    {
      "image": "images/cakes_images/cup_cake_six.webp",
      "name": "Mango Swirl",
      "price": "12.00",
      "bgColor": Colors.orange,
    },
    {
      "image": "images/cakes_images/cup_cake_three.webp",
      "name": "Berry Blast",
      "price": "11.00",
      "bgColor": Colors.red,
    },
    {
      "image": "images/cakes_images/cup_cake_four.webp",
      "name": "Green Goddess",
      "price": "13.00",
      "bgColor": Colors.green,
    },
    {
      "image": "images/cakes_images/cup_cake_five.webp",
      "name": "Tropical Twist",
      "price": "14.00",
      "bgColor": Colors.teal,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Static background color
          Container(
            color: drinks[0]["bgColor"] as Color?,
          ),
          PageView.builder(
            controller: _controller,
            itemCount: drinks.length,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  double value = 1.0;

                  if (_controller.position.haveDimensions) {
                    value = (_controller.page! - index);
                    value = (1 - (value.abs() * 0.8)).clamp(0.0, 1.0);
                  }

                  return Center(
                    child: DrinkCard(
                      data: drinks[index],
                      scale: value,
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

  DrinkCard({required this.data, required this.scale});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            colors: [
              data["bgColor"].withOpacity(0.4),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            // Static semi-circle background decoration
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                  color: data["bgColor"].withOpacity(0.3),
                  borderRadius: BorderRadius.circular(120),
                ),
              ),
            ),

            // Moving drink image
            Align(
              alignment: Alignment.center,
              child: Transform.scale(
                scale: scale,
                child: Image.asset(
                  data["image"],
                  height: 280,
                ),
              ),
            ),

            // Name
            Positioned(
              bottom: 90,
              left: 20,
              child: Text(
                data["name"],
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: data["bgColor"],
                ),
              ),
            ),

            // Price button
            Positioned(
              bottom: 25,
              left: 20,
              right: 20,
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
            )
          ],
        ),
      ),
    );
  }
}

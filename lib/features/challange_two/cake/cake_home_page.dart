import 'package:flutter/material.dart';
import 'package:flutter_animations/features/challange_two/cake/widgets/cake_button.dart';

class CakeHomePage extends StatefulWidget {
  const CakeHomePage({super.key});

  @override
  State<CakeHomePage> createState() => _CakeHomePageState();
}

class _CakeHomePageState extends State<CakeHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CakeButton(value: Icon(Icons.access_alarms)),
          
                  Row(
                    spacing: 20,
                    children: [
                      CakeButton(value: Icon(Icons.access_alarms)),
                      CakeButton(value: Icon(Icons.access_alarms)),
                    ],
                  ),
                ],
              ),
          
              SizedBox(height: 20,),
          
              CakeButton(value: Text('Choose Your favourite')),
          
              Center(
                heightFactor: 2,
                child: Image.asset(
                width: 300,
                height: 300,
                'images/cakes_images/cup_cake_one.webp',
                )),
          
                Spacer(),
          
              Row(
               spacing: 10,
                children: [
                  CakeButton(value: Icon(Icons.arrow_back_ios)),
          
                  Expanded(
                    child: CakeButton(value: Text('Choose Your favourite')),
                  ),
          
                  CakeButton(value: Icon(Icons.arrow_forward_ios)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

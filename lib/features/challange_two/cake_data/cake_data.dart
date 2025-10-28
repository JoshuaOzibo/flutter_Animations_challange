import 'package:flutter/material.dart';

class CakeModel {
  final String image;
  CakeModel({required this.image});

  factory CakeModel.fromJson(Map<String, dynamic> json){
    return CakeModel(image: json['image']);
  }
}


class CakeData {
  static List<CakeModel> cakes = [
    {"image": "images/cakes_images/cup_cake_one.webp",
    "color": Colors.pink,
    },
    {"image": "images/cakes_images/cup_cake_two.webp",
    "color": Colors.pink,
    },
    {"image": "images/cakes_images/cup_cake_three.webp",
      "color": Colors.pink,
    },
    {"image": "images/cakes_images/cup_cake_four.webp",
      "color": Colors.pink,
    },
    {"image": "images/cakes_images/cup_cake_five.webp",
      "color": Colors.pink,
    },
    {"image": "images/cakes_images/cup_cake_six.webp",
      "color": Colors.pink,
    },
    {"image": "images/cakes_images/cup_cake_seven.webp",
      "color": Colors.pink,
    },
  ].map((cake) => CakeModel.fromJson((cake))).toList();
}

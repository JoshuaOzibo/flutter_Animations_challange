class CakeModel {
  final String image;
  CakeModel({required this.image});

  factory CakeModel.fromJson(Map<String, dynamic> json){
    return CakeModel(image: json['image']);
  }
}


class CakeData {
  static List<CakeModel> cakes = [
    {"image": "images/cakes_images/cup_cake_one.webp"},
    {"image": "images/cakes_images/cup_cake_two.webp"},
    {"image": "images/cakes_images/cup_cake_three.webp"},
    {"image": "images/cakes_images/cup_cake_four.webp"},
    {"image": "images/cakes_images/cup_cake_five.webp"},
    {"image": "images/cakes_images/cup_cake_six.webp"},
    {"image": "images/cakes_images/cup_cake_seven.webp"},
  ].map((cake) => CakeModel.fromJson((cake))).toList();
}

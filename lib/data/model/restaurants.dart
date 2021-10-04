import 'package:restaurant_app/data/model/restaurant_item.dart';

class Restaurants {
  Restaurants({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  bool error;
  String message;
  int count;
  List<RestaurantItem> restaurants;

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
    error: json["error"],
    message: json["message"],
    count: json["count"],
    restaurants: List<RestaurantItem>.from(
        (json["restaurants"] as List)
            .map((x) => RestaurantItem.fromJson(x))),
  );
}
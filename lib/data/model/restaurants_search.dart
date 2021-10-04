import 'package:restaurant_app/data/model/restaurant_item.dart';

class RestaurantSearch {
  RestaurantSearch({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  bool error;
  int founded;
  List<RestaurantItem> restaurants;

  factory RestaurantSearch.fromJson(Map<String, dynamic> json) => RestaurantSearch(
    error: json["error"],
    founded: json["founded"],
    restaurants: List<RestaurantItem>.from(
        (json["restaurants"] as List).map((x) => RestaurantItem.fromJson(x))),
  );
}
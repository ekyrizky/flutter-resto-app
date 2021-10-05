class RestaurantDetail {
  RestaurantDetail({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  bool error;
  String message;
  RestaurantDetailItem restaurant;

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) =>
      RestaurantDetail(
        error: json["error"],
        message: json["message"],
        restaurant: RestaurantDetailItem.fromJson((json["restaurant"])),
      );
}

class RestaurantDetailItem {
  RestaurantDetailItem({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  String id;
  String name;
  String description;
  String city;
  String address;
  String pictureId;
  List<Category> categories;
  Menus menus;
  double rating;
  List<CustomerReview> customerReviews;

  factory RestaurantDetailItem.fromJson(Map<String, dynamic> json) =>
      RestaurantDetailItem(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"] ?? "",
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        menus: Menus.fromJson(json["menus"]),
        rating: json["rating"].toDouble(),
        customerReviews: List<CustomerReview>.from(
            json["customerReviews"].map((x) => CustomerReview.fromJson(x))),
      );
}

class Category {
  Category({
    required this.name,
  });

  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name: json["name"] ?? "",
  );
}

class CustomerReview {
  CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  String name;
  String review;
  String date;

  factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
    name: json["name"],
    review: json["review"],
    date: json["date"],
  );
}

class Menus {
  Menus({
    required this.foods,
    required this.drinks,
  });

  List<Menu> foods;
  List<Menu> drinks;

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
    foods: List<Menu>.from(
      json["foods"].map((x) => Menu.fromJson(x)),
    ),
    drinks:
    List<Menu>.from(json["drinks"].map((x) => Menu.fromJson(x))),
  );
}

class Menu {
  Menu({
    required this.name,
  });

  String name;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    name: json["name"] ?? "",
  );
}

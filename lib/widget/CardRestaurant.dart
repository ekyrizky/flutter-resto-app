import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant_item.dart';
import 'package:restaurant_app/utils/constant.dart';

class CardRestaurant extends StatelessWidget {
  final RestaurantItem restaurant;

  const CardRestaurant({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
      leading: Hero(
        tag: restaurant.pictureId,
        child: Image.network(
          '${Constant.BASE_IMG}${restaurant.pictureId}',
          width: 100,
          fit: BoxFit.cover,),),
      title: Text(restaurant.name),
      subtitle:Row(
        children: [
          Icon(Icons.location_on, size: 16,),
          SizedBox(width: 4),
          Text(restaurant.city),
          SizedBox(width: 24,),
          Icon(Icons.star, size: 16, color: Colors.orange,),
          Text(restaurant.rating.toString())
        ],
      ),
      onTap: () => Navigator.pushNamed(
        context,
        Routes.detail,
        arguments: restaurant.id,
      ),
    );
  }
}


import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/restaurant_detail.dart';
import 'package:restaurant_app/data/model/restaurants_search.dart';
import 'package:restaurant_app/utils/constant.dart';

class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<RestaurantSearch> getRestaurantList(String query) async {
    var url = '${Constant.BASE_URL}search?q=$query';
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {
      return RestaurantSearch.fromJson(json.decode(response.body));
    } else {
      throw Exception(Constant.failedLoadResto);
    }
  }

  Future<RestaurantDetail> getRestaurantDetail(String id) async {
    var url = '${Constant.BASE_URL}detail/$id';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return RestaurantDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception(Constant.failedLoadRestoDetail);
    }
  }
}
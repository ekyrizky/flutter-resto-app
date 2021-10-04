import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurants_search.dart';
import 'package:restaurant_app/utils/constant.dart';

enum ResultState {Loading, NoData, HasData, Error}

class RestaurantsProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantsProvider({required this.apiService}) {
    _fetchRestaurants("");
  }

  String _message = '';
  late RestaurantSearch _restaurants;
  late ResultState _state;

  String get message => _message;
  RestaurantSearch get result => _restaurants;
  ResultState get state => _state;

  set query(String query) {
    _fetchRestaurants(query);
  }

  Future<dynamic> _fetchRestaurants(String query) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurants = await apiService.getRestaurantList(query);
      if (restaurants.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = Constant.failedLoadResto;
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurants = restaurants;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
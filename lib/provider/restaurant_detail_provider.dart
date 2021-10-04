import 'package:flutter/widgets.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_detail.dart';
import 'package:restaurant_app/utils/constant.dart';

enum ResultState { Loading, NoData, HasData, Error }

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;
  RestaurantDetailProvider({required this.apiService, required this.id}) {
    _fetchRestaurantDetail(id);
  }

  String _message = '';
  late RestaurantDetail _restaurantDetail;
  late ResultState _state;

  String get message => _message;
  RestaurantDetail get restaurantDetail => _restaurantDetail;
  ResultState get state => _state;

  Future<dynamic> _fetchRestaurantDetail(String id) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurantDetail = await apiService.getRestaurantDetail(id);
      if (restaurantDetail.error) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = Constant.failedLoadRestoDetail;
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantDetail = restaurantDetail;
      }
    } catch (e) {
      print(e);
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}

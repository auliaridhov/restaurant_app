import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/detail_restaurant.dart';

enum ResultState { Loading, NoData, HasData, Error }

class DetailRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;

  DetailRestaurantProvider({this.apiService, this.id}) {
    _fetchDertailRestaurant(id);
  }

  DetailRestaurantsResult _detailResult;

  ResultState _state;
  String _message = '';

  String get message => _message;


  DetailRestaurantsResult get detailResult => _detailResult;

  ResultState get state => _state;


  Future<dynamic> _fetchDertailRestaurant(String id) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final rest = await apiService.detailRestaurant(id);
      if (rest.restaurant == null) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _detailResult = rest;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Upps! Cant reach data from server, please check your connection and try again.';
    }
  }
}
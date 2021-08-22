
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/list_restaurant.dart';

enum ResultState { Loading, NoData, HasData, Error }

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({this.apiService}) {
    _fetchAllArticle();
  }

  RestaurantsResult _articlesResult;
  ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantsResult get result => _articlesResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllArticle() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final article = await apiService.listRestaurant();
      if (article.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _articlesResult = article;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
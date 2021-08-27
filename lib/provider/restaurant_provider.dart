import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/list_restaurant.dart';
import 'package:restaurant_app/data/model/search_restaurant.dart';
import 'package:restaurant_app/utils/result_state.dart';

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({this.apiService}) {
    _fetchAllRestaurant();
  }

  RestaurantsResult _articlesResult;
  SearchRestaurantsResult _searchResult;

  ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantsResult get result => _articlesResult;
  SearchRestaurantsResult get searchResult => _searchResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllRestaurant() async {
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
      return _message = 'Upps! Cant reach data from server, please check your connection and try again.';
    }
  }

}
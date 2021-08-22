
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/list_restaurant.dart';
import 'package:restaurant_app/data/model/search_restaurant.dart';

enum ResultState { Loading, NoData, HasData, Error }

class SearchRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  final String query;

  SearchRestaurantProvider({this.apiService, this.query}) {
    _fetchSearchRestaurant(query);
  }

  SearchRestaurantsResult _searchResult;

  ResultState _state;
  String _message = '';

  String get message => _message;


  SearchRestaurantsResult get searchResult => _searchResult;

  ResultState get state => _state;


  Future<dynamic> _fetchSearchRestaurant(String query) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final rest = await apiService.searchRestaurant(query);
      if (rest.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _searchResult = rest;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
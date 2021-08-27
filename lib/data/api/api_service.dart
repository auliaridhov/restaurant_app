import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/detail_restaurant.dart';
import 'package:restaurant_app/data/model/list_restaurant.dart';
import 'package:restaurant_app/data/model/search_restaurant.dart';


class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static final String _list = 'list';
  static final String _search = 'search?q=';
  static final String _detail = 'detail/';

  Future<RestaurantsResult> listRestaurant() async {
    final response = await http.get(Uri.parse(_baseUrl + _list));
    if (response.statusCode == 200) {
      return RestaurantsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Restaurant');
    }
  }

  Future<SearchRestaurantsResult> searchRestaurant(String query) async {
    final response = await http.get(Uri.parse(_baseUrl + _search + query));
    if (response.statusCode == 200) {
      return SearchRestaurantsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Search Restaurant');
    }
  }


  Future<DetailRestaurantsResult> detailRestaurant(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + _detail + id));
    print(_baseUrl + _detail + id);
    if (response.statusCode == 200) {
      return DetailRestaurantsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Detail Restaurant');
    }
  }
}


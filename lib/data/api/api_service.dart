import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/list_restaurant.dart';


class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  static final String _list = 'list';

  static final String _apiKey = 'YOUR_API_KEY';
  static final String _category = 'business';
  static final String _country = 'id';

  Future<RestaurantsResult> listRestaurant() async {
    final response = await http.get(Uri.parse(_baseUrl + _list));
    if (response.statusCode == 200) {
      return RestaurantsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}


import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/list_restaurant.dart';
import 'package:restaurant_app/data/model/search_restaurant.dart';
import 'restaurant_provider_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {

  final client = MockClient();

  group('fetchRestaurant', () {
    test('returns all restaurant', () async {
      final responseAllRestaurant = jsonEncode(
          {
            "error": false,
            "message": "success",
            "count": 20,
            "restaurants": [
              {
                "id": "rqdv5juczeskfw1e867",
                "name": "Melting Pot",
                "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
                "pictureId": "14",
                "city": "Medan",
                "rating": 4.2
              },
              {
                "id": "s1knt6za9kkfw1e867",
                "name": "Kafe Kita",
                "description": "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. ...",
                "pictureId": "25",
                "city": "Gorontalo",
                "rating": 4
              }
            ]
          }
      );
      when(client
          .get(Uri.parse('https://restaurant-api.dicoding.dev/list')))
          .thenAnswer((_) async =>
          http.Response(responseAllRestaurant, 200));
      expect(await ApiService().listRestaurant(), isA<RestaurantsResult>());
    });
    final responseSearch = jsonEncode(
        {
          "error": false,
          "founded": 1,
          "restaurants": [
            {
              "id": "fnfn8mytkpmkfw1e867",
              "name": "Makan mudah",
              "description": "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, ...",
              "pictureId": "22",
              "city": "Medan",
              "rating": 3.7
            }
          ]
        }
    );
    test('return searched restaurant by query', () async {
      when(client
          .get(Uri.parse('https://restaurant-api.dicoding.dev/search?q=makan')))
          .thenAnswer((_) async => http.Response(responseSearch, 200));
      expect(await ApiService().searchRestaurant("makan"),  isA<SearchRestaurantsResult>());
    });
  });
}
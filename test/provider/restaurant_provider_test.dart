import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/data/api/api_service.dart';

void main() {
  test('get restaurant', () async {
    final listRestaurant = await ApiService().listRestaurant();
    var restaurant = listRestaurant.restaurants;
    expect(restaurant.length, 20);
  });

  test('get search restaurant', () async {
    final listRestaurant = await ApiService().searchRestaurant('makan');
    var restaurant = listRestaurant.restaurants;
    expect(restaurant[0].name, "Makan mudah");
  });
}
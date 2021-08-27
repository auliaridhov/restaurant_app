
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/preferences/preferences_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  PreferencesProvider({this.preferencesHelper}) {
    _getDailyNewsPreferences();
  }

  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  bool _isDailyRestaurantActive = false;
  bool get isDailyRestaurantActive => _isDailyRestaurantActive;



  void _getDailyNewsPreferences() async {
    _isDailyRestaurantActive = await preferencesHelper.isDailyRestaurantsActive;
    notifyListeners();
  }

  void enableDailyNews(bool value) {
    preferencesHelper.setDailyRestaurants(value);
    _getDailyNewsPreferences();
  }
}

// To parse this JSON data, do
//
//     final searchRestaurantsResult = searchRestaurantsResultFromJson(jsonString);

import 'dart:convert';

import 'package:restaurant_app/data/model/restaurant.dart';

SearchRestaurantsResult searchRestaurantsResultFromJson(String str) => SearchRestaurantsResult.fromJson(json.decode(str));

String searchRestaurantsResultToJson(SearchRestaurantsResult data) => json.encode(data.toJson());

class SearchRestaurantsResult {
  SearchRestaurantsResult({
    this.error,
    this.founded,
    this.restaurants,
  });

  bool error;
  int founded;
  List<Restaurant> restaurants;

  factory SearchRestaurantsResult.fromJson(Map<String, dynamic> json) => SearchRestaurantsResult(
    error: json["error"],
    founded: json["founded"],
    restaurants: List<Restaurant>.from(json["restaurants"].map((x) => Restaurant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "founded": founded,
    "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
  };
}


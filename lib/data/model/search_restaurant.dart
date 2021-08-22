// To parse this JSON data, do
//
//     final searchRestaurantsResult = searchRestaurantsResultFromJson(jsonString);

import 'dart:convert';

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

class Restaurant {
  Restaurant({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
  });

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    pictureId: json["pictureId"],
    city: json["city"],
    rating: json["rating"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "pictureId": pictureId,
    "city": city,
    "rating": rating,
  };
}

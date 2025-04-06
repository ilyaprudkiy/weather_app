import 'dart:convert';
import 'package:flutter/services.dart';

class CityItem {
  final String name;
  final double lon;
  final double lat;
  final String country;

  CityItem({required this.name, required this.lon, required this.lat, required this.country});

  factory CityItem.fromJson(Map<String, dynamic> json) {
    return CityItem(
      name: json['name'],
      lon: json['lon'],
      lat: json['lat'],
      country: json['country'],
    );
  }
}


Future<List<CityItem>> loadCities() async {
  final String response = await rootBundle.loadString('assets/cities_list.json');
  final List<dynamic> data = json.decode(response);

  return data.map((cityJson) => CityItem.fromJson(cityJson)).toList();
}

import 'package:flutter/cupertino.dart';

class Weather {
  final String name;
  var main;
  var wind;
  var weather;

  Weather({
    required this.main,
    required this.name,
    required this.weather,
    required this.wind,
  });
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        main: json['main'],
        name: json['name'],
        weather: json['weather'],
        wind: json['wind']);
  }
}

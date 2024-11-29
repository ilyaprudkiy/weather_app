import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class WeatherData {
  final String name;
  final int id;
  final String country;
  final double temperature;
  final double maxTemperature;
  final double minTemperature;
  final int sunrise;
  final int sunset;

  WeatherData(
      {required this.sunrise,
      required this.sunset,
      required this.name,
      required this.id,
      required this.country,
      required this.temperature,
      required this.maxTemperature,
      required this.minTemperature});

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}

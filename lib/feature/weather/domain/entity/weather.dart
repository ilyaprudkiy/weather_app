import 'package:json_annotation/json_annotation.dart';
part 'weather.g.dart';

@JsonSerializable()
class WeatherData {
  final int? id;
  final String? name;
  final String? country;
  final double? temperature;
  final double? minTemperature;
  final double? maxTemperature;
  final int? humidity;
  final double? windSpeed;
  final String? weatherDescription;
  final String? icon;
  final int? sunrise;
  final int? sunset;

  WeatherData(
      {required this.id,
      required this.name,
      required this.country,
      required this.temperature,
      required this.minTemperature,
      required this.maxTemperature,
      required this.humidity,
      required this.windSpeed,
      required this.weatherDescription,
      required this.icon,
      required this.sunrise,
      required this.sunset});

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************
WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      country: json['sys']?['country'] as String?,
      temperature: json['main']?['temp']?.toDouble(),
      minTemperature: json['main']?['temp_min']?.toDouble(),
      maxTemperature: json['main']?['temp_max']?.toDouble(),
      humidity: json['main']?['humidity'] as int?,
      windSpeed: json['wind']?['speed']?.toDouble(),
      weatherDescription: (json['weather'] as List<dynamic>?)
          ?.first['description'] as String?,
      icon: (json['weather'] as List<dynamic>?)
          ?.first['icon'] as String?,
      sunrise: json['sys']?['sunrise'] as int?,
      sunset: json['sys']?['sunset'] as int?,
);

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'temperature': instance.temperature,
      'minTemperature': instance.minTemperature,
      'maxTemperature': instance.maxTemperature,
      'humidity': instance.humidity,
      'windSpeed': instance.windSpeed,
      'weatherDescription': instance.weatherDescription,
      'icon': instance.icon,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };

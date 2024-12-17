// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
      sunrise: (json['sunrise'] as num?)?.toInt(),
      sunset: (json['sunset'] as num?)?.toInt(),
      name: json['name'] as String?,
      id: (json['id'] as num?)?.toInt(),
      country: json['country'] as String?,
      temperature: (json['temperature'] as num?)?.toDouble(),
      maxTemperature: (json['maxTemperature'] as num?)?.toDouble(),
      minTemperature: (json['minTemperature'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'country': instance.country,
      'temperature': instance.temperature,
      'maxTemperature': instance.maxTemperature,
      'minTemperature': instance.minTemperature,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };

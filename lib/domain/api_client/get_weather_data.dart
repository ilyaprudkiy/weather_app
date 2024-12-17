import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/domain/configuration/configuration.dart';
import 'package:weather_app/domain/entity/weather.dart';

class ApiWeatherData {
  Future<List<WeatherData>> fetchWeather({required String lat, required String lon,}) async {
    final response = await http.get(Uri.parse(Configutation.host(lat: lat, lon: lon)));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      // Проверяем, что данные содержат массив weather
      if (data.containsKey('weather')) {
        final List<dynamic> weatherList = data['weather'];
        return weatherList.map((e) => WeatherData.fromJson(e)).toList();
      } else {
        throw Exception('Ключ "weather" отсутствует в данных');
      }
    } else {
      throw Exception('Ошибка загрузки: ${response.statusCode}');
    }
  }
}

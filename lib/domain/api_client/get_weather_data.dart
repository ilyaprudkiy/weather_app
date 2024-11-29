import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/domain/configuration/configuration.dart';
import 'package:weather_app/domain/entity/weather.dart';

class ApiWeatherData {
  Future<List<WeatherData>> fetchWeather() async {
    final response = await http.get(Uri.parse(Configutation.host));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> weatherData = data['weather' 'main' 'sys'];
      return weatherData.map((json) => WeatherData.fromJson(json)).toList();
    } else {
      throw Exception('Не удалось загрузить данные');
    }
  }
}

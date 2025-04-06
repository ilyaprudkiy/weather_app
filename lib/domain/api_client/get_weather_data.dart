import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/domain/configuration/configuration.dart';
import 'package:weather_app/domain/entity/weather.dart';
class ApiWeatherData {
  Future<List<WeatherData>> fetchWeather({
    required String lat,
    required String lon,
  }) async {
    final response =
    await http.get(Uri.parse(Configutation.host(lat: lat, lon: lon)));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      // Логируем ответ для отладки
      print('Ответ API: $data');

      // Проверяем наличие обязательных ключей
      if (!data.containsKey('weather') || !(data['weather'] is List)) {
        throw Exception('Ключ "weather" отсутствует или некорректен');
      }

      // Логируем JSON перед парсингом
      print('JSON перед вызовом fromJson: $data');

      try {
        final weatherData = WeatherData.fromJson(data);
        print('Успешный парсинг: $weatherData');
        return [weatherData];
      } catch (e) {
        print('Ошибка парсинга JSON: $e');
        throw Exception('Не удалось преобразовать данные в WeatherData');
      }
    } else {
      throw Exception('Ошибка загрузки: ${response.statusCode}');
    }
  }
}
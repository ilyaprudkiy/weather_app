import 'package:weather_app/domain/entity/weather.dart';

import '../domain/api_client/get_weather_data.dart';

class WeatherDataProvider {
  final _apiWeather = ApiWeatherData();

  Future<List<WeatherData>> getWeatherData() async {
    final weather = await _apiWeather.fetchWeather();
    return weather;
  }
}





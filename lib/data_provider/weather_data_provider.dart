import 'package:weather_app/data_provider/city_data_provider.dart';
import 'package:weather_app/domain/entity/weather.dart';
import '../domain/api_client/get_weather_data.dart';

class WeatherDataProvider {
  final _apiWeather = ApiWeatherData();
  final _cities = CityDataProvider();

  Future<List<WeatherData>> getWeatherData(String lon , String lat) async {
    final weather =
        await _apiWeather.fetchWeather(lon: lon, lat: lat);
    return weather.toList();
  }
}

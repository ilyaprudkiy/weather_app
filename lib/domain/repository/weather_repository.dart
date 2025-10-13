import 'package:weather_app/data/weather_data_provider.dart';
import '../entity/weather.dart';

abstract class WeatherRepository {
  Future<List<WeatherData>> getWeather(String lon, String lat);
}

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataProvider _weatherDataProvider;

  WeatherRepositoryImpl({required WeatherDataProvider weatherDataProvider})
      : _weatherDataProvider = weatherDataProvider;

  @override
  Future<List<WeatherData>> getWeather(String lon, String lat) async {
    final weather = await _weatherDataProvider.getWeatherData(lon, lat);
    return weather.toList();
  }
}

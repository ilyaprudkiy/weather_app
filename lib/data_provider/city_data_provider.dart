import 'package:hive/hive.dart';
import 'package:weather_app/utils/cities_loader.dart';


class CityDataProvider {
  late List<CityItem>? _cities = [];

  Future<List<CityItem>> loadUserCities() async {
    final box = await Hive.openBox<CityItem>('cities');
    _cities = box.values.toList().cast<CityItem>(); // Преобразуем в список
    return _cities!;
  }

}

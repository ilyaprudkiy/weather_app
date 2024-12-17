import 'package:hive/hive.dart';
import '../domain/entity/list_city.dart';

class CityDataProvider {
  late List<City>? _userCities = [];

  Future<List<City>> loadUserCities() async {
    final box = await Hive.openBox<City>('user_city');
    _userCities = box.values.toList().cast<City>(); // Преобразуем в список
    return _userCities!;
  }

  Future<void> addCity(int index, City city) async {
    if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(CityAdapter());
    final box = await Hive.openBox<City>('user_city');
    await box.put(index, city);
    _userCities = box.values.toList().cast<City>();
    box.close();
  }

  Future<void> removeCity(int index) async {
    if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(CityAdapter());
    final box = await Hive.openBox<City>('user_city');
    await box.deleteAt(index);
    _userCities = box.values.toList().cast<City>();
    box.close();
  }
}

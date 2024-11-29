import 'package:hive/hive.dart';
import '../domain/entity/list_city.dart';

class CityDataProvider {
    late   List<City>? _userCities = [];

    Future<List<City>> loadUserCities() async {
      // Если список уже загружен, возвращаем его
      if (_userCities != null) {
        return _userCities!;
      }

      // Регистрируем адаптер (если это ещё не сделано)
      if (!Hive.isAdapterRegistered(1)) {
        Hive.registerAdapter(CityAdapter());
      }

      // Открываем коробку
      final box = await Hive.openBox<City>('user_city');

      // Сохраняем данные в локальную переменную
      _userCities = box.values.toList();

      // Возвращаем список
      return _userCities!;


    }
  Future<void> addCity(int index, City city) async {
    if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(CityAdapter());
    final box = await Hive.openBox<City>('user_city');
    await box.put(index, city);
    box.close();
  }

  Future<void> removeCity(int index) async {
    if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(CityAdapter());
    final box = await Hive.openBox<City>('user_city');
    await box.deleteAt(index);
    box.close();
  }
}

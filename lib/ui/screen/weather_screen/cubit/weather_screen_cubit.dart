import 'package:bloc/bloc.dart';
import 'package:weather_app/utils/cities_loader.dart';
import '../../../../domain/entity/weather.dart';
import '../../../../domain/repository/weather_repository.dart';

class WeatherScreenState {
  final List<WeatherData> weatherData;
  final List<CityItem> cities;
  final int indexCity;
  final String currentCity;

  WeatherScreenState(
      {required this.indexCity,
      required this.currentCity,
      required this.weatherData,
      required this.cities});

  WeatherScreenState.initial()
      : weatherData = const [],
        indexCity = 0,
        currentCity = '',
        cities = const [];

  WeatherScreenState copyWith(
      {List<WeatherData>? weatherData,
      int? indexCity,
      List<CityItem>? cities,
      String? currentCity}) {
    return WeatherScreenState(
      indexCity: indexCity ?? this.indexCity,
      weatherData: weatherData ?? this.weatherData,
      cities: cities ?? this.cities,
      currentCity: currentCity ?? this.currentCity,
    );
  }
}

class WeatherScreenCubit extends Cubit<WeatherScreenState> {
  final WeatherRepository _weatherRepository;

  WeatherScreenCubit(this._weatherRepository)
      : super(WeatherScreenState.initial()) {
    initialize();
  }

  void initialize() async {
    await getCitiesList();
    getWeather();
  }

  void currentCity() {
    final city = state.cities[0].name;
    emit(state.copyWith(currentCity: city));
  }

  // void loadVideo(String url) {
  //   // Освобождаем предыдущий контроллер, если он существует
  //   state.videoController?.dispose();
  //
  //   // Создаем новый контроллер
  //   final VideoPlayerController newController =
  //       VideoPlayerController.networkUrl(Uri.parse(url));
  //
  //   // Инициализируем новый контроллер
  //   newController.initialize().then((_) {
  //     // Обновляем состояние с новым контроллером
  //     emit(state.copyWith(videoController: newController));
  //     newController.setLooping(true);
  //     newController.play();
  //   });
  // }

  void getWeather() async {
    final city = state.cities[0];
    final lon = city.lon.toString();
    final lat = city.lat.toString();
    try {
      final weather = await _weatherRepository.getWeather(lon, lat);

      if (weather.isNotEmpty) {
        final newState = state.copyWith(weatherData: weather);
        emit(newState);
      } else {
        throw Exception('Погода не найдена');
      }
    } catch (e) {
      print('Ошибка загрузки погоды: $e');
    }
  }

  Future<void> getCitiesList() async {
    final cities = await loadCities();
    emit(state.copyWith(cities: cities));
  }
}

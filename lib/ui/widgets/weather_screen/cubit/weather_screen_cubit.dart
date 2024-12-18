import 'package:bloc/bloc.dart';
import 'package:weather_app/data_provider/city_data_provider.dart';
import '../../../../data_provider/weather_data_provider.dart';
import '../../../../domain/entity/list_city.dart';
import '../../../../domain/entity/weather.dart';

class WeatherScreenState {
  final List<WeatherData> weatherData;
  final List<City> usersCity;
  final bool tabList;

  WeatherScreenState(
      {required this.tabList,
      required this.weatherData,
      required this.usersCity});

  WeatherScreenState.initial()
      : weatherData = const [],
        tabList = false,
        usersCity = const [];

  WeatherScreenState copyWith(
      {List<WeatherData>? weatherData, List<City>? usersCity, bool? tabList}) {
    return WeatherScreenState(
      weatherData: weatherData ?? this.weatherData,
      usersCity: usersCity ?? this.usersCity,
      tabList: tabList ?? this.tabList,
    );
  }
}

class WeatherScreenCubit extends Cubit<WeatherScreenState> {
  final _dataProvider = CityDataProvider();
  final _weatherProvider = WeatherDataProvider();

  WeatherScreenCubit(WeatherScreenState weatherScreenState) : super(WeatherScreenState.initial()) {
    getUsersCity();
    getWeather();
  }

  void getWeather() async {
    try {
      final weather = await _weatherProvider.getWeatherData();

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


  void tabList() {
    if (state.usersCity.isNotEmpty) {
      emit(state.copyWith(tabList: true));
    } else {
      emit(state.copyWith(tabList: false));
    }
  }

  void getUsersCity() async {
    final userCities = await _dataProvider.loadUserCities();
    if (userCities.isNotEmpty) {
      emit(state.copyWith(usersCity: userCities));
    } else {
      print('список пуст');
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:weather_app/data_provider/city_data_provider.dart';
import 'package:weather_app/utils/cities_loader.dart';

class MainScreenState {
  final List<CityItem> cities;
  final bool isSelected;
  final List<CityItem> userCity;

  MainScreenState({
    required this.cities,
    required this.isSelected,
    required this.userCity,
  });

  MainScreenState.initial()
      : cities = const [],
        userCity = const [],
        isSelected = false;

  MainScreenState copyWith(
      {List<CityItem>? cities, bool? isSelected, List<CityItem>? userCity}) {
    return MainScreenState(
      cities: cities ?? this.cities,
      userCity: userCity ?? this.userCity,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class MainScreenCubit extends Cubit<MainScreenState> {
  final _citiesDataProvider = CityDataProvider();

  MainScreenCubit(MainScreenState mainScreenState) : super(MainScreenState.initial()) {
    getCitiesList();
  }

  void getCitiesList() async {
    final cities = await loadCities();
    emit(state.copyWith(cities: cities));
  }
}

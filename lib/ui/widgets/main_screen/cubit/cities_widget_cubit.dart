import 'package:bloc/bloc.dart';
import 'package:weather_app/data_provider/city_data_provider.dart';
import 'package:weather_app/utils/cities_loader.dart';

class CitiesScreenState {
  final List<CityItem> cities;
  final bool isSelected;
  final List<CityItem> userCity;

  CitiesScreenState({
    required this.cities,
    required this.isSelected,
    required this.userCity,
  });

  CitiesScreenState.initial()
      : cities = const [],
        userCity = const [],
        isSelected = false;

  CitiesScreenState copyWith(
      {List<CityItem>? cities, bool? isSelected, List<CityItem>? userCity}) {
    return CitiesScreenState(
      cities: cities ?? this.cities,
      userCity: userCity ?? this.userCity,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class CitiesScreenCubit extends Cubit<CitiesScreenState> {
  final _citiesDataProvider = CityDataProvider();

  CitiesScreenCubit(CitiesScreenState mainScreenState) : super(CitiesScreenState.initial())  {
    getCitiesList();

  }

  void getCitiesList() async {
    final cities = await loadCities();
    emit(state.copyWith(cities: cities));
  }
}

import 'package:bloc/bloc.dart';
import 'package:weather_app/data_provider/city_data_provider.dart';
import '../../../../domain/entity/list_city.dart';

class MainScreenState {
  final List<City> cities;
  final bool isSelected;
  final List<City> userCity;

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
      {List<City>? cities, bool? isSelected, List<City>? userCity}) {
    return MainScreenState(
      cities: cities ?? this.cities,
      userCity: userCity ?? this.userCity,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class MainScreenCubit extends Cubit<MainScreenState> {
  final _citiesDataProvider = CityDataProvider();

  MainScreenCubit(MainScreenState mainScreenState)
      : super(MainScreenState.initial()) {
    getCity();
  }

  void getCity() async {
    final city = City.citiesList;
    emit(state.copyWith(cities: city));
  }

  // void isSelectedCity(int index) async {
  //   if (state.cities[index].isSelected == false) {
  //     final updatedCity = state.cities[index].copyWith(isSelected: true);
  //     final updatedCities = List<City>.from(state.cities);
  //     updatedCities[index] = updatedCity;
  //
  //     emit(state.copyWith(cities: updatedCities));
  //    final  userSelectedCity = state.cities[index];
  //
  //     if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(CityAdapter());
  //     final box = await Hive.openBox<City>('user_city');
  //     await box.put(index, userSelectedCity);
  //     await box.close();
  //   } else {
  //     final updatedCity = state.cities[index].copyWith(isSelected: false);
  //     final updatedCities = List<City>.from(state.cities);
  //     updatedCities[index] = updatedCity;
  //     emit(state.copyWith(cities: updatedCities));
  //
  //     if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(CityAdapter());
  //     final box = await Hive.openBox<City>('user_city');
  //     await box.deleteAt(index);
  //     await box.close();
  //   }
  // }

  void isSelectedCity(int index) async {
    // Получаем текущее состояние выбранного города
    final currentCity = state.cities[index];
    final isSelected = currentCity.isSelected;

    // Обновляем статус выбранного города
    final updatedCity = currentCity.copyWith(isSelected: !isSelected);
    final updatedCities = List<City>.from(state.cities);
    updatedCities[index] = updatedCity;

    // Обновляем состояние
    emit(state.copyWith(cities: updatedCities));

    if (!isSelected) {
      // Если город не был выбран, то сохраняем его
      await _citiesDataProvider.addCity(index, updatedCity);
    } else {
      // Если город был выбран, то удаляем его
      await _citiesDataProvider.removeCity(index);
    }
  }
}

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:weather_app/data_provider/city_data_provider.dart';

class LoaderState {
  final bool isLoading;
  final bool isSelectedCity;

  LoaderState({required this.isSelectedCity, required this.isLoading});

  const LoaderState.initial()
      : isSelectedCity = false,
        isLoading = false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoaderState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          isSelectedCity == other.isSelectedCity;

  @override
  int get hashCode => isLoading.hashCode;

  LoaderState copyWith({bool? isLoading, bool? isSelectedCity}) {
    return LoaderState(
      isLoading: isLoading ?? this.isLoading,
      isSelectedCity: isSelectedCity ?? this.isSelectedCity,
    );
  }
}

class LoaderCubit extends Cubit<LoaderState> {
  final _dataProvider = CityDataProvider();
  late Timer _timer;

  LoaderCubit(super.initialState) {
    isCityListEmpty();
  }

  void start() {
    emit(state.copyWith(isLoading: true));
    const delay = Duration(seconds: 3);
    _timer = Timer(delay, () {
      emit(state.copyWith(isLoading: false));
      _timer.cancel();
    });
  }

  void isCityListEmpty() async {
    final citiesUser = await _dataProvider.loadUserCities(); // Ждём результат от провайдера
    if (citiesUser.isNotEmpty) {
      if (!state.isSelectedCity) { // Проверяем, изменилось ли состояние
        final newState = state.copyWith(isSelectedCity: true);
        emit(newState); // Обновляем состояние только если оно изменилось
      }
    } else {
      if (state.isSelectedCity) { // Если состояния уже изменилось, обновляем его
        final newState = state.copyWith(isSelectedCity: false);
        emit(newState);
      }
    }
  }
}
import 'dart:async';
import 'package:bloc/bloc.dart';



class LoaderState {
  final bool isLoading;
  final bool isSelectedCity;

  LoaderState({required this.isSelectedCity, required this.isLoading});

  LoaderState.initial()
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

  LoaderState copyWith(
      {bool? isLoading,
      bool? isSelectedCity,}) {
    return LoaderState(
      isLoading: isLoading ?? this.isLoading,
      isSelectedCity: isSelectedCity ?? this.isSelectedCity,
    );
  }
}

class LoaderCubit extends Cubit<LoaderState> {
  late Timer _timer;


  LoaderCubit(super.initialState);

  void start() {
    emit(state.copyWith(isLoading: true));
    const delay = Duration(seconds: 3);
    _timer = Timer(delay, () {
      emit(state.copyWith(isLoading: false));
      _timer.cancel();
    });
  }

  // Future<VideoPlayerController> loadVideo(String url) async {
  //   // Освобождаем предыдущий контроллер, если он существует
  //   state.videoController?.dispose();
  //
  //   // Создаем новый контроллер
  //   final newController = VideoPlayerController.networkUrl(Uri.parse(url));
  //
  //   // Инициализируем контроллер
  //   await newController.initialize();
  //
  //   // Настраиваем контроллер
  //   newController.setLooping(true);
  //   newController.play();
  //   return newController;
  // }

  // void videoScreen() async {
  //   final controller = await loadVideo(AnimationScreenPath.videoLoaderScreen);
  //   final newState = state.copyWith(videoController: controller);
  //   emit(newState);
  // }
  //
  // @override
  // Future<void> close() {
  //   // Освобождаем контроллер при закрытии Cubit
  //   state.videoController?.dispose();
  //   return super.close();
  // }

  // void isCityListEmpty() async {
  //   final citiesUser =
  //       await _dataProvider.loadUserCities(); // Ждём результат от провайдера
  //   if (citiesUser.isNotEmpty) {
  //     if (!state.isSelectedCity) {
  //       // Проверяем, изменилось ли состояние
  //       final newState = state.copyWith(isSelectedCity: true);
  //       emit(newState); // Обновляем состояние только если оно изменилось
  //     }
  //   } else {
  //     if (state.isSelectedCity) {
  //       // Если состояния уже изменилось, обновляем его
  //       final newState = state.copyWith(isSelectedCity: false);
  //       emit(newState);
  //     }
  //   }
  // }
}

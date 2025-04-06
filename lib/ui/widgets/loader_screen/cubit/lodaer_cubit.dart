import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:weather_app/data_provider/city_data_provider.dart';
import '../../../../domain/api_client/get_video_screen.dart';
import '../../../../domain/configuration/video_path/video_path.dart';

class LoaderState {
  final bool isLoading;
  final bool isSelectedCity;
  VideoPlayerController? videoController;

  LoaderState(
      {required this.videoController,
      required this.isSelectedCity,
      required this.isLoading});

  LoaderState.initial()
      : isSelectedCity = false,
        videoController = null,
        isLoading = false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoaderState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          videoController == other.videoController &&
          isSelectedCity == other.isSelectedCity;

  @override
  int get hashCode => isLoading.hashCode;

  LoaderState copyWith(
      {bool? isLoading,
      bool? isSelectedCity,
      VideoPlayerController? videoController}) {
    return LoaderState(
      isLoading: isLoading ?? this.isLoading,
      videoController: videoController ?? this.videoController,
      isSelectedCity: isSelectedCity ?? this.isSelectedCity,
    );
  }
}

class LoaderCubit extends Cubit<LoaderState> {
  final _dataProvider = CityDataProvider();
  late Timer _timer;
  final _videoApiClient = ApiVideoScreen();

  LoaderCubit(super.initialState) {
    isCityListEmpty();
    videoScreen();
  }

  void start() {
    emit(state.copyWith(isLoading: true));
    const delay = Duration(seconds: 3);
    _timer = Timer(delay, () {
      emit(state.copyWith(isLoading: false));
      _timer.cancel();
    });
  }

  Future<VideoPlayerController> loadVideo(String url) async {
    // Освобождаем предыдущий контроллер, если он существует
    state.videoController?.dispose();

    // Создаем новый контроллер
    final newController = VideoPlayerController.networkUrl(Uri.parse(url));

    // Инициализируем контроллер
    await newController.initialize();

    // Настраиваем контроллер
    newController.setLooping(true);
    newController.play();
    return newController;
  }

  void videoScreen() async {
    final controller = await loadVideo(VideoScreenPath.videoLoaderScreen);
    final newState = state.copyWith(videoController: controller);
    emit(newState);
  }

  @override
  Future<void> close() {
    // Освобождаем контроллер при закрытии Cubit
    state.videoController?.dispose();
    return super.close();
  }

  void isCityListEmpty() async {
    final citiesUser =
        await _dataProvider.loadUserCities(); // Ждём результат от провайдера
    if (citiesUser.isNotEmpty) {
      if (!state.isSelectedCity) {
        // Проверяем, изменилось ли состояние
        final newState = state.copyWith(isSelectedCity: true);
        emit(newState); // Обновляем состояние только если оно изменилось
      }
    } else {
      if (state.isSelectedCity) {
        // Если состояния уже изменилось, обновляем его
        final newState = state.copyWith(isSelectedCity: false);
        emit(newState);
      }
    }
  }
}

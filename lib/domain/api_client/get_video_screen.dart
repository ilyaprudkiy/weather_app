import 'package:video_player/video_player.dart';

class ApiVideoScreen {


  Future<VideoPlayerController> loadVideo(String url) async {
    // Освобождаем предыдущий контроллер, если он существует
    // state.videoController?.dispose();

    // Создаем новый контроллер
    final VideoPlayerController newController =

    VideoPlayerController.networkUrl(Uri.parse(url));

    // Инициализируем контроллер
    await newController.initialize();

    // Настраиваем контроллер
    newController.setLooping(true);
    newController.play();

    // Возвращаем инициализированный контроллер
    return newController;
  }
}

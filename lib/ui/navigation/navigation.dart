import 'package:flutter/material.dart';
import '../../domain/factory/screen_factory,dart.dart';

abstract class MainNavigationRouteNames {
  static const loaderWidget = '/';
  static const mainScreen = '/main_screen';
  static const weatherScreen = '/main_screen/weather_screen';
}


class MainNavigation {
static final _screenFactory = ScreenFactory();
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.loaderWidget: (_) => _screenFactory.makeLoader(),
    MainNavigationRouteNames.mainScreen: (_) => _screenFactory.mainScreenWidget(),
    MainNavigationRouteNames.weatherScreen: (_) => _screenFactory.getWeather(),
  };
}

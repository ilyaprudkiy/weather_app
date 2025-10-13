import 'package:flutter/material.dart';
import 'factory/screen_factory,dart.dart';

abstract class MainNavigationRouteNames {
  static const loaderWidget = '/';
  static const mainScreen = '/main_screen';
  static const weatherScreen = '/main_screen/weather_screen';
  static const signUpScreen = '/sign_up_screen';
  static const loginScreen = '/login_screen';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.loaderWidget: (_) => _screenFactory.makeLoader(),
    MainNavigationRouteNames.mainScreen: (_) => _screenFactory.citiesScreen(),
    MainNavigationRouteNames.weatherScreen: (context) =>
        _screenFactory.getWeather(context),
    MainNavigationRouteNames.signUpScreen: (context) =>
        _screenFactory.signUpScreen(context),
    MainNavigationRouteNames.loginScreen: (_) => _screenFactory.loginScreen(),
  };
}

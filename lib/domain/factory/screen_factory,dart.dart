import 'package:flutter/material.dart';
import 'package:weather_app/ui/widgets/weather_screen/cubit/weather_screen_cubit.dart';
import 'package:weather_app/ui/widgets/weather_screen/weather_screen.dart';
import '../../ui/widgets/loader_screen/cubit/lodaer_cubit.dart';
import '../../ui/widgets/loader_screen/loader_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../ui/widgets/main_screen/cubit/main_screen_cubit.dart';
import '../../ui/widgets/main_screen/main_srceen_weather.dart';

class ScreenFactory {
  Widget makeLoader() {
    return BlocProvider<LoaderCubit>(
      create: (_) => LoaderCubit(const LoaderState.initial()),
      lazy: false,
      child: const LoaderWidget(),
    );
  }

 Widget mainScreenWidget() {
 return BlocProvider<MainScreenCubit>(
     create: (context) => MainScreenCubit( MainScreenState.initial()),
     child: const MainScreenWidget(),
   );
 }

  Widget getWeather() {
    return BlocProvider<WeatherScreenCubit>(
      create: (context) => WeatherScreenCubit( WeatherScreenState.initial()),
      child: const WeatherScreenWidget(),
    );
  }



}

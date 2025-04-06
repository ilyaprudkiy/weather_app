import 'package:flutter/material.dart';
import 'package:weather_app/ui/widgets/weather_screen/cubit/weather_screen_cubit.dart';
import 'package:weather_app/ui/widgets/weather_screen/weather_screen.dart';
import '../../ui/widgets/loader_screen/cubit/lodaer_cubit.dart';
import '../../ui/widgets/loader_screen/widgets/loader_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../ui/widgets/main_screen/cities_screen.dart';
import '../../ui/widgets/main_screen/cubit/cities_widget_cubit.dart';

class ScreenFactory {
  Widget makeLoader() {
    return BlocProvider<LoaderCubit>(
      create: (_) => LoaderCubit( LoaderState.initial()),
      lazy: false,
      child: const LoaderWidget(),
    );
  }

  Widget citiesScreen() {
    return BlocProvider<CitiesScreenCubit>(
      create: (context) => CitiesScreenCubit(CitiesScreenState.initial()),
      child: const CitiesScreen(),
    );
  }

  Widget getWeather() {
    return BlocProvider<WeatherScreenCubit>(
      create: (context) => WeatherScreenCubit(WeatherScreenState.initial()),
      child: const WeatherScreenWidget(),
    );
  }
}

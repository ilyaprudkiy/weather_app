import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/repository/auth_repository.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';
import '../../screen/loader_screen/cubit/lodaer_cubit.dart';
import '../../screen/loader_screen/widgets/loader_widget.dart';
import '../../screen/login_screen/cubit/login_screen_cubit.dart';
import '../../screen/login_screen/login_screen.dart';
import '../../screen/main_screen/cities_screen.dart';
import '../../screen/main_screen/cubit/cities_widget_cubit.dart';
import '../../screen/sign_up_screen/cubit/sign_up_screen_cubit.dart';
import '../../screen/sign_up_screen/sign_up_screen.dart';
import '../../screen/weather_screen/cubit/weather_screen_cubit.dart';
import '../../screen/weather_screen/weather_screen.dart';


class ScreenFactory {

  Widget loginScreen() {
    return BlocProvider<LoginScreenCubit>(create: (_) => LoginScreenCubit(LoginScreenState(),),
  lazy: false,
  child: const LoginScreenWidget(),
  );
}

  Widget makeLoader() {
    return BlocProvider<LoaderCubit>(
      create: (context) => LoaderCubit(LoaderState.initial()),
      lazy: false,
      child: const LoaderWidget(),
    );
  }

  Widget signUpScreen(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (_) => SignUpCubit(context.read<AuthRepository>(),),
      lazy: false,
      child: const SignUpScreenWidget(),
    );
  }

  Widget citiesScreen() {
    return BlocProvider<CitiesScreenCubit>(
      create: (context) => CitiesScreenCubit(CitiesScreenState.initial()),
      child: const CitiesScreen(),
    );
  }

  Widget getWeather(BuildContext context) {
    return BlocProvider<WeatherScreenCubit>(
      create: (context) => WeatherScreenCubit(context.read<WeatherRepository>()),
      child: const WeatherScreenWidget(),
    );
  }
}

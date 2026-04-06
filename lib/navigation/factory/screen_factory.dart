import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feature/auth/presentation/login_screen/cubit/login_screen_cubit.dart';
import '../../feature/auth/presentation/login_screen/login_screen.dart';
import '../../feature/auth/presentation/sign_up_screen/cubit/sign_up_screen_cubit.dart';
import '../../feature/auth/presentation/sign_up_screen/sign_up_screen.dart';
import '../../feature/auth/presentation/welcome_screen/cubit/welcome_screen_cubit.dart';
import '../../feature/auth/presentation/welcome_screen/welcome_screen.dart';
import '../../feature/weather/weather_screen/cubit/weather_screen_cubit.dart';
import '../../feature/weather/weather_screen/weather_screen.dart';

class ScreenFactory {
  Widget loginScreen() {
    return BlocProvider<LoginScreenCubit>(
      create: (_) => LoginScreenCubit(
        LoginScreenState(),
      ),
      lazy: false,
      child: const LoginScreenWidget(),
    );
  }

  Widget makeLoader() {
    return BlocProvider<WelcomeScreenCubit>(
      create: (context) => WelcomeScreenCubit(WelcomeScreenState.unknown),
      lazy: false,
      child: const WelcomeScreen(),
    );
  }

  Widget signUpScreen(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (_) => SignUpCubit(SignUpInitial()),
      lazy: false,
      child: const SignUpScreenWidget(),
    );
  }

  Widget getWeather(BuildContext context) {
    return BlocProvider<WeatherScreenCubit>(
      create: (context) => WeatherScreenCubit(WeatherScreenState()),
      child: const WeatherScreenWidget(),
    );
  }
}

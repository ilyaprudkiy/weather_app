import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/add_images/images.dart';
import 'package:weather_app/ui/widgets/loader_screen/cubit/lodaer_cubit.dart';
import '../../navigation/navigation.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<LoaderCubit>();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(209, 221, 245, 2),
      body: BlocListener<LoaderCubit, LoaderState>(
        listener: (context, state) {
          if (state.isLoading == true) {
            Timer(const Duration(seconds: 2), () {
              if (cubit.state.isSelectedCity == false) {
                Navigator.of(context)
                    .pushNamed(MainNavigationRouteNames.mainScreen);
              } else {
                Navigator.of(context)
                    .pushNamed(MainNavigationRouteNames.weatherScreen);
              }
            });
          }
        },
        child: Stack(
          children: [
            StartedWidget(cubit: cubit),
            if (cubit.state.isLoading == true)
              const Center(child: CircularProgressIndicator())
            else
              StartedWidget(cubit: cubit),
          ],
        ),
      ),
    );
  }
}

class StartedWidget extends StatelessWidget {
  const StartedWidget({
    super.key,
    required this.cubit,
  });

  final LoaderCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(image: AssetImage(AppImages.weatherSummer)),
        ElevatedButton(
            style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromRGBO(140, 169, 228, 1))),
            onPressed: () {
              if (cubit.state.isLoading == false) {
                cubit.start();
              }
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(),
              child: Text(
                'Get started',
                style: TextStyle(color: Colors.white),
              ),
            )),
      ],
    );
  }
}

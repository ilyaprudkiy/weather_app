import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:weather_app/ui/widgets/loader_screen/cubit/lodaer_cubit.dart';
import 'package:weather_app/ui/widgets/loader_screen/widgets/start_botton_widget.dart';
import '../../../navigation/navigation.dart';
import 'main_information_widget.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<LoaderCubit>();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: BlocListener<LoaderCubit, LoaderState>(
          listener: (context, state) {
            if (state.isLoading) {
              Timer(const Duration(seconds: 2), () {
                Navigator.of(context)
                    .pushNamed(MainNavigationRouteNames.weatherScreen);
              });
            }
          },
          child: Stack(
            children: [
              Container(
                color: Colors.black.withOpacity(0.3),
              ),
              if (cubit.state.videoController != null &&
                  cubit.state.videoController!.value.isInitialized)
                SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover, // Растягиваем видео на весь экран
                    child: SizedBox(
                      width: cubit.state.videoController!.value.size.width,
                      height: cubit.state.videoController!.value.size.height,
                      child: VideoPlayer(cubit.state.videoController!),
                    ),
                  ),
                ),
              const MainInformationWidget(),
              StartedWidget(cubit: cubit),
              if (cubit.state.isLoading)
                const Center(child: CircularProgressIndicator())
            ],
          ),
        ),
      ),
    );
  }
}

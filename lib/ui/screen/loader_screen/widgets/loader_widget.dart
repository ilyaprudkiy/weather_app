import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/screen/loader_screen/widgets/start_botton_widget.dart';
import '../../../../config/configuration/network_icons/network_icons.dart';
import '../../../navigation/navigation.dart';
import '../cubit/lodaer_cubit.dart';

// class LoaderWidget extends StatelessWidget {
//   const LoaderWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.watch<LoaderCubit>();
//     return Container(
//       decoration: const BoxDecoration(
//           gradient: LinearGradient(
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//         colors: [
//           Color(0xFFE0EAFC), // верх
//           Color(0xFFCFDEF3), // низ
//         ],
//       )),
//       child: Scaffold(
//         body: BlocListener<LoaderCubit, LoaderState>(
//           listener: (context, state) {
//             if (state.isLoading) {
//               Timer(const Duration(seconds: 2), () {
//                 Navigator.of(context)
//                     .pushNamed(MainNavigationRouteNames.weatherScreen);
//               });
//             }
//           },
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Lottie.asset(
//                     repeat: true,
//                     height: 170,
//                     width: 170,
//                     AnimationScreenPath.aniWeatherLoaderScreen),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 StartedWidget(cubit: cubit),
//                 if (cubit.state.isLoading)
//                   const Center(child: CircularProgressIndicator())
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<LoaderCubit>();
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFE0EAFC), // верх
          Color(0xFFCFDEF3), // низ
        ],
      )),
      child: Scaffold(
        body: BlocListener<LoaderCubit, LoaderState>(
          listener: (context, state) {
            if (state.isLoading) {
              Timer(const Duration(seconds: 2), () {
                Navigator.of(context)
                    .pushNamed(MainNavigationRouteNames.weatherScreen);
              });
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  NetworkIcons.cloudIcons,
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
                // LottieBuilder.asset(
                //   AnimationScreenPath.aniWeatherLoaderScreen,
                //   controller: _controller,
                //   onLoaded: (composition) {
                //     _controller
                //       ..duration = composition.duration
                //       ..repeat();
                //   },
                //   height: 170,
                //   width: 170,
                // ),
                const SizedBox(
                  height: 1,
                ),
                LoginButtonWidget(cubit: cubit),
                const SizedBox(
                  height: 10,
                ),
                SingUpButtonWidget(cubit: cubit),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.network(
                        NetworkIcons.googleIcon,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.network(
                        NetworkIcons.instagramIcon,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.network(
                        NetworkIcons.facebookIcon,
                        height: 20,
                        width: 20,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextButton.icon(
                    onPressed: () {
                      if (cubit.state.isLoading == false) {
                        cubit.start();
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_right_alt_sharp,
                      color: Colors.lightBlue,
                    ),
                    label: const Text(
                      'or continue as guest',
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
                if (cubit.state.isLoading)
                  const Center(child: CircularProgressIndicator())
              ],
            ),
          ),
        ),
      ),
    );
  }

//
// class IconsInContainer extends StatelessWidget {
//   const IconsInContainer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 140),
//       child: Center(
//         child: Row(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: Container(
//                     padding: const EdgeInsets.all(40),
//                     margin:
//                         const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//                     width: 120,
//                     height: 120,
//                     decoration: BoxDecoration(
//                       color: Colors.white70.withOpacity(0.2),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: const NetworkIconWidget(
//                         pathImage: NetworkIcons.prozentWater)),
//               ),
//               const SizedBox(
//                 width: 16,
//               ),
//               Container(
//                   padding: const EdgeInsets.all(10),
//                   margin:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//                   width: 60,
//                   height: 80,
//                   decoration: BoxDecoration(
//                       color: Colors.white70.withOpacity(0.2),
//                       borderRadius: BorderRadius.circular(16)),
//
//                   child: const NetworkIconWidget(
//                       pathImage: NetworkIcons.calendarIcon)),
//               const SizedBox(
//                 width: 16,
//               ),
//               Container(
//                   padding: const EdgeInsets.all(15),
//                   margin:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//                   width: 60,
//                   height: 80,
//                   decoration: BoxDecoration(
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Colors.black45,
//                           blurRadius: 12,
//                           offset: Offset(0, 4),
//                         )
//                       ],
//                       color: Colors.white.withOpacity(0.3),
//                       borderRadius: BorderRadius.circular(16)),
//                   child: const NetworkIconWidget(
//                       pathImage: NetworkIcons.rainIcon)),
//             ]),
//       ),
//     );
//   }
// }
}

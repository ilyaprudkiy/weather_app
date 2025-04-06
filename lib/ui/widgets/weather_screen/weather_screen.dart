import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/widgets/weather_screen/cubit/weather_screen_cubit.dart';
import '../../navigation/navigation.dart';

class WeatherScreenWidget extends StatelessWidget {
  const WeatherScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(  children: [
         Image.network('https://media.istockphoto.com/id/2060491755/de/foto/sky-landscapes-collage-weather-forecast-global-warming-climate-change-support-environmental.jpg?s=2048x2048&w=is&k=20&c=O_KuckWo4nWNqvDy_hrNWRToZuUdKKkuDxiV3zpGZ4E='),
        ListView(children: const [
        Column(
          children: [
            AppBarWidget(),
            Padding(padding: EdgeInsets.all(10), child: TemperatureWidget()),
          ],
        )
      ]),
    ] ));
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<WeatherScreenCubit>();
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 40, right: 10),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(13)),
                child: const Icon(
                  Icons.menu,
                  color: Colors.grey,
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(left: 10, top: 40, right: 20),
              child: CurrentCityWidget(cubit: cubit))
        ]);
  }
}

class CurrentCityWidget extends StatelessWidget {
  const CurrentCityWidget({
    super.key,
    required this.cubit,
  });

  final WeatherScreenCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: 250,
        child: TextField(
          onTap: () {
            Navigator.of(context)
                .pushNamed(MainNavigationRouteNames.mainScreen);
          },
          readOnly: true,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 25),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: cubit.state.cities[0].name,
              hintStyle: const TextStyle(
                color: Colors.blue,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              suffixIcon: const Icon(Icons.my_location_outlined)),
        ));
  }
}

class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<WeatherScreenCubit>();
    return Text.rich(
      TextSpan(
        text: '2311',
        // Температура
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: '°C', // Символ градусов
            style: TextStyle(
                fontSize: 20, color: Colors.black), // Чуть меньше и серее
          ),
        ],
      ),
    );
  }

//
// class ListCityUserWidget extends StatelessWidget {
//   const ListCityUserWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.watch<WeatherScreenCubit>();
//     return Padding(
//         padding: const EdgeInsets.only(),
//         child: FittedBox(
//             fit: BoxFit.cover,
//             child: Container(
//                 width: 100,
//                 height: 160,
//                 child: ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: cubit.state.cities.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Text(
//                         cubit.state.cities[index].name,
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 17,
//                         ),
//                       );
//                     }))));
//   }
}

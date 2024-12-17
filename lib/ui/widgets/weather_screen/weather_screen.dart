import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/widgets/weather_screen/cubit/weather_screen_cubit.dart';

class WeatherScreenWidget extends StatelessWidget {
  const WeatherScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(140, 169, 228, 1),
      body: Column(
        children: [
          AppBarWidget(),
          MainWeatherWidget(),
        ],
      ),
    );
  }
}

class MainWeatherWidget extends StatelessWidget {
  const MainWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
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
              child: SizedBox(
                  height: 50,
                  width: 250,
                  child: TextField(
                    onTap: () {
                    },
                    readOnly: true,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 25),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixText: 'London',
                        prefixStyle: const TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        suffixIcon: const Icon(Icons.my_location_outlined)),
                  )))
        ]);
  }
}

class ListCityUserWidget extends StatelessWidget {
  const ListCityUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<WeatherScreenCubit>();
    return Padding(
        padding: const EdgeInsets.only(),
        child: FittedBox(
            fit: BoxFit.cover,
            child: Container(
                width: 100,
                height: 160,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: cubit.state.usersCity.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        cubit.state.usersCity[index].name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      );
                    }))));
  }
}

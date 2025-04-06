import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/widgets/main_screen/cubit/cities_widget_cubit.dart';

class CitiesScreen extends StatelessWidget {
  const CitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.grey,
        body: Column(children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [SearchCityWidget()]),
          CityItemWidget(),
        ]));
  }
}

class SearchCityWidget extends StatelessWidget {
  const SearchCityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CitiesScreenCubit>();
    return SizedBox(
        height: 50,
        width: 250,
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 25),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              prefixStyle: const TextStyle(
                color: Colors.blue,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              suffixIcon: const Icon(Icons.my_location_outlined)),
        ));
  }
}

class CityItemWidget extends StatelessWidget {
  const CityItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CitiesScreenCubit>();
    return ListView.builder(
        itemCount: cubit.state.cities.length,
        itemBuilder: (context, index) {
          final city = cubit.state.cities[index].name;
          return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Фон для контейнера
                  borderRadius: BorderRadius.circular(10.0), // Скругленные углы
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2), // Смещение тени
                    ),
                  ],
                ),
                child: Text(city),
              ));
        });
  }
}

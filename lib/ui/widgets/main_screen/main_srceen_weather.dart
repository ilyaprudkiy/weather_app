import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/navigation/navigation.dart';
import 'package:weather_app/ui/widgets/main_screen/cubit/main_screen_cubit.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  MainScreenWidgetState createState() => MainScreenWidgetState();
}

class MainScreenWidgetState extends State<MainScreenWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MainScreenCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(140, 169, 228, 1),
        title: const Text('City'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: cubit.state.cities.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromRGBO(243, 244, 248, 6),
                      width: 2),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(228, 236, 248, 10),
                      spreadRadius: 5,
                      blurRadius: 7,
                    )
                  ]),
              height: 60,
              child: InkWell(
                onTap: () {

                  cubit.state.cities[index].lat;
                  cubit.state.cities[index].lon;

                  Navigator.of(context).pushNamed(MainNavigationRouteNames.weatherScreen);
                },
                  child: Center(child: Text(cubit.state.cities[index].name))),
            );
          }),
    );
  }
}

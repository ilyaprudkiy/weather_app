
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/add_images/images.dart';
import 'package:weather_app/ui/widgets/weather_screen/cubit/weather_screen_cubit.dart';

class WeatherScreenWidget extends StatelessWidget {
  const WeatherScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<WeatherScreenCubit>();
    return const Scaffold(
      backgroundColor: Colors.white,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(padding: EdgeInsets.only(top: 30, left: 20), child:  ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image(
                image: AssetImage(
                  AppImages.userAvatar,
                ),
                width: 60,
                height: 50,
              ))),
           Stack(children: [

            cubit.state.tabList == false ?
           Padding(padding: EdgeInsets.only(right: 20, top: 30), child: Row(children: [
             Padding(padding: EdgeInsets.only(right: 5), child:  Icon(
                Icons.location_pin,
                color: Colors.red.shade500,
              )),
              const Padding(padding: EdgeInsets.only(), child: Text('London', style: TextStyle(fontSize: 19),)),
              IconButton(
                  onPressed: () {
                    cubit.tabList();
                  },
                  icon: const Icon(Icons.format_list_bulleted)),

            ])) : const ListCityUserWidget(),
          ]),
        ]);
  }
}


class ListCityUserWidget extends StatelessWidget {
  const ListCityUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<WeatherScreenCubit>();
  return  Padding(padding: EdgeInsets.only(), child: FittedBox(fit: BoxFit.cover,
    child:   Container(width: 100, height: 160,
        child: ListView.builder(shrinkWrap: true,
        itemCount: cubit.state.usersCity.length,
        itemBuilder: (BuildContext context, int  index) {
        return Text(cubit.state.usersCity[index].name, style: const  TextStyle(color: Colors.black,fontSize: 17,),);
  }))));
  }

}

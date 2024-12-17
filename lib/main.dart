import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/ui/navigation/navigation.dart';
import 'domain/entity/list_city.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(CityAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: mainNavigation.routes,
      debugShowCheckedModeBanner: false,
      initialRoute: MainNavigationRouteNames.loaderWidget,
    );
  }
}

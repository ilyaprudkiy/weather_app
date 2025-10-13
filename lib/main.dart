import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weather_app/ui/navigation/navigation.dart';
import 'config/configuration/configuration.dart';
import 'data/auth_data_provider.dart';
import 'domain/entity/list_city.dart';
import 'domain/repository/auth_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(CityAdapter());
  }

  await Supabase.initialize(
    url: Configuration.urlSupabase,
    anonKey: Configuration.anonKey,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(

      providers: [
        RepositoryProvider<AuthRepository>(
          create: (_) => AuthRepositoryImpl(
            authDataProvider: AuthDataProvider(),
          ),
        ),
      ],
      child: MaterialApp(
        routes: mainNavigation.routes,
        debugShowCheckedModeBanner: false,
        initialRoute: MainNavigationRouteNames.loaderWidget,
      ),
    );
  }
}

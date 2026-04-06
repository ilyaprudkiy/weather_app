import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/di/service_locator.dart';
import 'navigation/navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BootstrapApp());
}

class BootstrapApp extends StatefulWidget {
  const BootstrapApp({super.key});

  @override
  State<BootstrapApp> createState() => _BootstrapAppState();
}

class _BootstrapAppState extends State<BootstrapApp> {
  late final Future<void> _initFuture;

  Future<void> _init() async {
    await Supabase.initialize(
      url: 'https://ijqugaqrpljhmilinlol.supabase.co',
      anonKey: 'sb_publishable_fDgWW7zxCoJaP44W3AAV1Q_1n3oSw1Y',
    ).timeout(const Duration(seconds: 15));

    await initServiceLocator().timeout(const Duration(seconds: 5));
  }

  @override
  void initState() {
    super.initState();
    _initFuture = _init();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }
        if (snapshot.hasError) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Init error: ${snapshot.error}',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        }
        return const MyApp();
      },
    );
  }
}

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: mainNavigation.routes,
      initialRoute: MainNavigationRouteNames.loaderWidget,
    );
  }
}

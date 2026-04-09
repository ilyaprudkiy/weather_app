class Configuration {
  static const String apiKey = '750a350873c45a578d1db2e8ba34a29b';

  static String host({
    required String lat,
    required String lon,
  }) =>
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric&lang=ru';
  static const String anonKey =
      'sb_publishable_fDgWW7zxCoJaP44W3AAV1Q_1n3oSw1Y';
  static const String urlSupabase = 'https://ijqugaqrpljhmilinlol.supabase.co';
}

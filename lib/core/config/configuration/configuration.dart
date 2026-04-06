class Configuration {
  static const String apiKey = '750a350873c45a578d1db2e8ba34a29b';

  static String host({
    required String lat,
    required String lon,
  }) =>
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric&lang=ru';
  static const String anonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJudnFpenR6dWhucnFwY2dybGRvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTg3MzkxOTcsImV4cCI6MjA3NDMxNTE5N30.K8OYtfT9qcGkCfmxk0eIOhttTKVRnNIRH1QGc3VeWBc';
  static const String urlSupabase = 'https://bnvqiztzuhnrqpcgrldo.supabase.co';
}

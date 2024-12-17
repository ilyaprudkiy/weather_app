class Configutation {
   static const String apiKey = 'a087ca2e20182a7f8fe0f99cbf155361';
static String host({required String lat, required String lon,}) => 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey';
}
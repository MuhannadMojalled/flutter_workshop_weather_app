import 'dart:convert';
import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static String BASE_URL = 'http://api.openweathermap.org/data/2.5/weather';
  static String API = 'f34d2ec59738a5a6a76b87595cda347a';
  WeatherService();

  Future<Weather> getWeather(String cityName) async {
    final response = await http.get(
      Uri.parse('$BASE_URL?q=$cityName&appid=$API&units=metric'),
    );

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to load weather data');
    }
  }
}

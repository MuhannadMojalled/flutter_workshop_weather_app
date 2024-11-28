import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final weatherSerivce = WeatherService();
  Weather? weather;

  fetchWeather({String cityName = "jeddah"}) async {
    try {
      final getweather = await weatherSerivce.getWeather(cityName);
      setState(() {
        weather = getweather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  String getWeatherAnimation(String mainCond) {
    switch (mainCond) {
      case "Clear":
        return 'assets/sunny.json';
      case "Clouds":
        return 'assets/cloud.json';
      case "Rain":
        return 'assets/rainy.json';
      case "Thunderstorm":
        return 'assets/thunder.json';
      default:
        return 'assets/sunny.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 35,
                  ),
                  Text(
                    weather?.cityName ?? "City...",
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 130),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    getWeatherAnimation(weather?.mainCond ?? "clouds"),
                  ),
                  Text(
                    "${weather?.temp.round().toString()}°",
                    style: const TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

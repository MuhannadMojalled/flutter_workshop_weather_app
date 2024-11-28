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
  // variables and objects

  // the fetchweather function to get the weather from the weatherervice class

  // the initState function to call the fetchweather function

  // the getWeatherAnimation function to get the animation based on the weather condition

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // the first Comlumn

              const SizedBox(height: 130),

              // the second Comlumn
            ],
          ),
        ),
      ),
    );
  }
}

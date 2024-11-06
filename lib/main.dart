import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/screens/weather/bloc/weather_bloc.dart';
import 'package:weather_app/screens/weather/bloc/weather_event.dart';
import 'package:weather_app/services/network_service.dart';
import 'screens/weather/weather_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => WeatherBloc(NetworkService())
          ..add(const FetchWeatherEvent(54.32, 38.48)),
        child: const WeatherScreen(),
      ),
    );
  }
}

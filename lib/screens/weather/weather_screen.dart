import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'widgets/weather_card.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg1.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Main content
          const SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                WeatherCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

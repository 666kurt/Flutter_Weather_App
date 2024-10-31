import 'package:flutter/material.dart';
import 'package:weather_app/screens/weather/widgets/weather_info.dart';
import 'package:weather_app/services/network_service.dart';
import '../../models/weather.dart';
import 'widgets/weather_card.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<WeatherData> _weatherData;
  final NetworkService _networkService = NetworkService();

  @override
  void initState() {
    super.initState();
    _weatherData = _networkService.fetchData(54.32, 48.38);
  }

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
          FutureBuilder(
            future: _weatherData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text("There is error!"));
              } else if (!snapshot.hasData) {
                return const Center(child: Text("There is has no data!"));
              } else {
                final WeatherData weather = snapshot.requireData;
                return SafeArea(
                  minimum: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      WeatherCard(weatherData: weather),
                      const SizedBox(height: 20),
                      const WeatherInfo(),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

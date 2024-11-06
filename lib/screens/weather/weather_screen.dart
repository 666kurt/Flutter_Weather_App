import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/screens/weather/bloc/weather_bloc.dart';
import 'package:weather_app/screens/weather/bloc/weather_state.dart';
import 'package:weather_app/screens/weather/widgets/weather_info.dart';
import 'widgets/weather_card.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

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
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is WeatherErrorState) {
                return Center(child: Text(state.error));
              } else if (state is WeatherLoadedState) {
                return SafeArea(
                  minimum: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      WeatherCard(weatherData: state.weatherData),
                      const SizedBox(height: 20),
                      const WeatherInfo(),
                    ],
                  ),
                );
              } else {
                return const Center(child: Text("No data"));
              }
            },
          )
        ],
      ),
    );
  }
}

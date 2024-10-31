import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import '../../../theme/theme.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({
    super.key,
    required this.weatherData,
  });

  final WeatherData weatherData;

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  bool _isExpanded = true; // свойство для хранения состоянии анимации

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Today", style: AppFonts.headline),
                const SizedBox(width: 10),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_down_outlined
                      : Icons.keyboard_arrow_up_outlined,
                  color: AppColors.cardTextColor,
                ),
              ],
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInBack,
            child: _isExpanded ? _getContent() : const SizedBox.shrink(),
          )
        ],
      ),
    );
  }

  Widget _getContent() {
    final WeatherData weather = widget.weatherData;
    final DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(weather.dt * 1000);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.sunny,
              size: 72,
              color: AppColors.cardTextColor,
            ),
            const SizedBox(width: 20),
            Text("${weather.main.temp.ceil()}°", style: AppFonts.headlineLarge),
          ],
        ),
        Text(weather.weather[0].main, style: AppFonts.bodySemiBold),
        const SizedBox(height: 15),
        Text(weather.name, style: AppFonts.bodyMedium),
        const SizedBox(height: 15),
        Text(dateTime.toString(), style: AppFonts.bodyMedium),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Feels like ${weather.main.feelsLike.ceil()}",
                style: AppFonts.bodyMedium),
            const SizedBox(width: 10),
            Container(
              width: 1,
              height: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.cardTextColor,
              ),
            ),
            const SizedBox(width: 10),
            Text("Min. temp ${weather.main.tempMin.ceil()}",
                style: AppFonts.bodyMedium),
          ],
        )
      ],
    );
  }
}

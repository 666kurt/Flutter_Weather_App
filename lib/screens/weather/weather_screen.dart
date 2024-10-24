import 'package:flutter/material.dart';
import 'package:weather_app/theme/app_colors.dart';
import '../../theme/app_fonts.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(25),
          width: 360,
          height: 380,
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(35),
          ),
          child: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Today", style: AppFonts.headline),
                  Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 24,
                    color: AppColors.cardTextColor,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sunny,
                    size: 72,
                    color: AppColors.cardTextColor,
                  ),
                  SizedBox(width: 20),
                  Text("32°", style: AppFonts.headlineLarge),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

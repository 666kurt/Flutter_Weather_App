import 'package:flutter/material.dart';
import '../../../theme/theme.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({
    super.key,
  });

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 380,
      padding: const EdgeInsets.all(25),
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
              SizedBox(width: 10),
              Icon(Icons.keyboard_arrow_down_outlined),
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
          ),
        ],
      ),
    );
  }
}

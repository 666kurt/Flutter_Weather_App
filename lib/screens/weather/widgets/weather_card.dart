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
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Today", style: AppFonts.headline),
              SizedBox(width: 10),
              Icon(
                Icons.keyboard_arrow_down_outlined,
                color: AppColors.cardTextColor,
              ),
            ],
          ),
          const Row(
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
          const Text("Sunny", style: AppFonts.bodySemiBold),
          const SizedBox(height: 15),
          const Text("California, Los Angeles", style: AppFonts.bodyMedium),
          const SizedBox(height: 15),
          const Text("21 Oct 2019", style: AppFonts.bodyMedium),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Feels like 30", style: AppFonts.bodyMedium),
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
              const Text("Sunset 18:20", style: AppFonts.bodyMedium),
            ],
          )
        ],
      ),
    );
  }
}

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
    return Column(
      children: [
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
    );
  }
}

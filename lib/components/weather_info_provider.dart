import 'package:climata/constants/constants.dart';
import 'package:flutter/material.dart';

class WeatherInfoProvider extends StatelessWidget {
  const WeatherInfoProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: const EdgeInsets.all(25.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Weather Information",
                  textAlign: TextAlign.left,
                  style: kWeatherTitleTextStyle,
                ),
                const SizedBox(height: kSizedBoxHeight),

                // weather info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    weatherInfoContainer(
                        Icons.thermostat_rounded, "Feels like", "32"),
                    weatherInfoContainer(
                        Icons.air_outlined, "Wind Speed", "123"),
                  ],
                ),
                const SizedBox(height: kSizedBoxHeightForWeatherInfo),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    weatherInfoContainer(Icons.thunderstorm_outlined, "Precipitation", "32"),
                    weatherInfoContainer(Icons.speed_outlined, "Humidity", "123"),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Expanded weatherInfoContainer(IconData icon, String title, String value) {
    return Expanded(
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue,
            child: Icon(icon, size: 30, color: Colors.white),
          ),
          const SizedBox(width: kSizedBoxWidth),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Text(value),
            ],
          )
        ],
      ),
    );
  }
}

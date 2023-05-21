import 'package:climata/components/weather_forecast.dart';
import 'package:climata/constants/constants.dart';
import 'package:flutter/material.dart';

class WeatherInfoProvider extends StatelessWidget {
  final dynamic weatherInfo;
  final dynamic weatherForecast;

  const WeatherInfoProvider({
    super.key,
    this.weatherInfo,
    this.weatherForecast,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
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
                    weatherInfoContainer(Icons.thermostat_rounded, "Feels like",
                        weatherInfo?['data']?[0]['app_temp']),
                    weatherInfoContainer(Icons.air_outlined, "Wind Speed",
                        weatherInfo?['data']?[0]['wind_spd']),
                  ],
                ),
                const SizedBox(height: kSizedBoxHeightForWeatherInfo),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    weatherInfoContainer(Icons.thunderstorm_outlined,
                        "Precipitation", weatherInfo?['data']?[0]['pres']),
                    weatherInfoContainer(Icons.speed_outlined, "Humidity",
                        weatherInfo?['data']?[0]['rh']),
                  ],
                ),

                // weather forecast section
                (weatherForecast != null
                    ? WeatherForecast(weatherForecast: weatherForecast)
                    : Container())
              ],
            ),
          )),
    );
  }

  Expanded weatherInfoContainer(IconData icon, String title, dynamic value) {
    return Expanded(
      child: Row(
        children: [
          CircleAvatar(
            radius: kWeatherInfoIconContainerRadius,
            backgroundColor: Colors.blue[400],
            child: Icon(icon, size: kWeatherInfoIconSize, color: Colors.white),
          ),
          const SizedBox(width: kSizedBoxWidth),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: kWeatherInfoHeadingTextStyle,
              ),
              Text(
                (value?.toStringAsFixed(2) ?? "-"),
                style: kWeatherInfoValueTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}

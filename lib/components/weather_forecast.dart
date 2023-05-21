import 'package:climata/constants/constants.dart';
import 'package:climata/util/util.dart';
import 'package:flutter/material.dart';

class WeatherForecast extends StatelessWidget {
  final dynamic weatherForecast;
  const WeatherForecast({
    super.key,
    this.weatherForecast,
  });

  @override
  Widget build(BuildContext context) {
    List<dynamic> weatherForecastData = weatherForecast?['data'];

    return Container(
      height: 110,
      width: 120,
      margin: const EdgeInsets.only(top: kSizedBoxHeight),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        children: weatherForecastData.map(
          (wForecast) {
            return forecastBox(wForecast);
          },
        ).toList(),
      ),
    );
  }

  Card forecastBox(wForecast) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              ClimataUtil.formatProviderDate(wForecast['timestamp_local']),
              style: const TextStyle(color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Image(
                image: AssetImage(prepareImagePath(wForecast)),
                height: 40,
                width: 40,
              ),
            ),
            Text(
              '${wForecast['temp'].toStringAsFixed(1)}\u00b0c',
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  String prepareImagePath(wForecast) {
    String fileName = ClimataUtil.getWeatherIcon(
      wForecast['weather']['code'],
      (wForecast['pod'] == "d"),
    );

    return 'images/$fileName.png';
  }
}

import 'package:climata/service/locator_brain.dart';
import 'package:climata/util/util.dart';
import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final dynamic weatherDetails;

  const WeatherIcon({
    super.key,
    this.weatherDetails,
  });

  String prepareImagePath() {
    String fileName = ClimataUtil.getWeatherIcon(
      weatherDetails?['data']?[0]['weather']['code'],
      (weatherDetails?['data']?[0]['pod'] == "d"),
    );

    return 'images/$fileName.png';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Image(image: AssetImage(prepareImagePath()))),
          Text(
            '${weatherDetails?['data']?[0]['temp'].toStringAsFixed(1) ?? 0}\u00b0c',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 70,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
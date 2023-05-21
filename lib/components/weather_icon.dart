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
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image(image: AssetImage(prepareImagePath()), width: 330),
          Container(
            margin: const EdgeInsets.only(left: 120),
            child: Text(
              '${weatherDetails?['data']?[0]['temp'].toStringAsFixed(0) ?? 0}\u00b0c',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 90,
                  fontWeight: FontWeight.w800),
            ),
          )
        ],
      ),
    );
  }
}
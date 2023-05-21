import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Image(image: AssetImage("images/8.png"))),
          Text(
            "12\u00b0c",
            style: TextStyle(
                color: Colors.white,
                fontSize: 70,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
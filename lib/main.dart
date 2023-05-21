import 'package:climata/components/widget_container.dart';
import 'package:climata/locator_brain.dart';
import 'package:flutter/material.dart';

import 'components/weather_icon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Climata',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    LocatorBrain locator = LocatorBrain();
    locator
        .getCurrentPosition()
        .then((value) => {print(locator.latitude), print(locator.longitude)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
              Colors.blue,
              Colors.blue.shade300,
            ])),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // weather icon
            WeatherIcon(),
            // temperature display
            // weather description
            // current date display
            // weather information card
            WidgetContainer()
          ],
        ),
      )),
    );
  }
}

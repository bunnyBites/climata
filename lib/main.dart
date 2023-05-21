import 'package:climata/components/weather_info_provider.dart';
import 'package:climata/locator_brain.dart';
import 'package:climata/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/weather_icon.dart';
import 'constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Climata',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.blue,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      home: const HomePage(),
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light, 
      child: Scaffold(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const WeatherIcon(),

                  // weather description
                  const Text(
                    "Its a Cloudy day",
                    textAlign: TextAlign.center,
                    style: kTitleTextStyle,
                  ),

                  // current date display
                  currentDateDisplay(),
                ],
              )),
              // weather icon

              // weather information card
              const WeatherInfoProvider()
            ],
          ),
        )),
      ),
    );
  }

  Row currentDateDisplay() {
    String currentFormattedDate = ClimataUtil().getFormattedCurrentDate();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currentFormattedDate,
          style: kCurrentDateTextStyle,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.refresh),
          color: Colors.white,
        )
      ],
    );
  }
}

import 'package:climata/components/weather_info_provider.dart';
import 'package:climata/service/locator_brain.dart';
import 'package:climata/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'components/weather_icon.dart';
import 'constants/constants.dart';

void main() {
  runApp(const MyApp());
}

LocatorBrain locator = LocatorBrain();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Climata',
      home: LoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: Center(
          child: SpinKitChasingDots(
            color: Colors.blue.shade900,
            size: 50.0,
          ),
        ),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic weatherDetails;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getWeatherDetails();
  }

  void getWeatherDetails() {
    setState(() {
      isLoading = true;
    });

    locator.getCurrentPosition().then((value) => {
          setState(() {
            weatherDetails = locator.weatherDetails;
            isLoading = false;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    (isLoading) ? context.loaderOverlay.show() : context.loaderOverlay.hide();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark
          .copyWith(statusBarColor: Colors.blue.shade300),
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
                  WeatherIcon(weatherDetails: weatherDetails),

                  // weather description
                  Text(
                    ClimataUtil.getWeatherDescription(
                        weatherDetails?['data']?[0]['weather']['code'],
                        (weatherDetails?['data']?[0]['pod'] == "d")),
                    textAlign: TextAlign.center,
                    style: kTitleTextStyle,
                  ),

                  // current date display
                  currentDateDisplay(),
                ],
              )),

              // weather information card
              WeatherInfoProvider(weatherInfo: weatherDetails)
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
          onPressed: () {
            getWeatherDetails();
          },
          icon: const Icon(Icons.refresh),
          color: Colors.white,
        )
      ],
    );
  }
}

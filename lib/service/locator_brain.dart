import 'package:climata/service/weather_service.dart';
import 'package:geolocator/geolocator.dart';

class LocatorBrain {
  dynamic weatherDetails;

  Future<void> getCurrentPosition() async {

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // TODO apply current location fetched from geo location
    weatherDetails = await WeatherService.getCurrentWeatherByQuery(10.7905, 78.7047);
  }
}
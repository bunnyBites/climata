import 'package:climata/service/weather_service.dart';
import 'package:geolocator/geolocator.dart';

class LocatorBrain {
  dynamic weatherDetails;
  dynamic weatherForecast;
  double latitude = 10.7905;
  double longitude = 78.7047;

  Future<void> getCurrentPosition() async {

    // Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // TODO apply current location fetched from geo location
    weatherDetails = await WeatherService.getCurrentWeatherByQuery(latitude, longitude);
    weatherForecast = await WeatherService.getWeatherForecastByQuery(latitude, longitude);
  }
}
import 'package:climata/service/weather_service.dart';
import 'package:geolocator/geolocator.dart';

class LocatorBrain {
  dynamic weatherDetails;
  dynamic weatherForecast;
  double latitude = 0;
  double longitude = 0;

  Future<void> getCurrentPosition() async {

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;

    weatherDetails = await WeatherService.getCurrentWeatherByQuery(latitude, longitude);
    weatherForecast = await WeatherService.getWeatherForecastByQuery(latitude, longitude);
  }
}
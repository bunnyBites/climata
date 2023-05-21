import 'package:geolocator/geolocator.dart';

class LocatorBrain {
  double latitude = 0;
  double longitude = 0;

  Future<void> getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
    latitude = position.latitude;
    longitude = position.longitude;
  }
}
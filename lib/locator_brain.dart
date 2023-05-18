import 'package:geolocator/geolocator.dart';

class LocatorBrain {
  Future<Position> getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
    return position;
  }
}
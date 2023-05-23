import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiKey = "5a0b16ac65a349339b6960355fa9cc87";
const String baseUrl = "api.weatherbit.io";

const String geolocatorBaseUrl = "api.openweathermap.org";
const String geolocatorApiKey = "5a240c73d4ccc6381da9f0114cc006e0";

class WeatherService {
  static Future<dynamic> getCurrentWeatherByQuery(double latitude, double longitude) async {
    Uri url = Uri.https(baseUrl, "/v2.0/current", {
      "lat": latitude.toString(),
      "lon": longitude.toString(),
      "key": apiKey
    });

    dynamic response = await http.get(url);

    return json.decode(response.body);
  }

  static Future<dynamic> getWeatherForecastByQuery(double latitude, double longitude) async {
    Uri url = Uri.https(baseUrl, "/v2.0/forecast/hourly", {
      "lat": latitude.toString(),
      "lon": longitude.toString(),
      "key": apiKey
    });

    dynamic response = await http.get(url);

    return json.decode(response.body);
  }

  static Future<dynamic> getLatLonByLocationName(String locationName) async {
    Uri url = Uri.http(geolocatorBaseUrl, "/geo/1.0/direct", {
      "q": locationName,
      "limit": "1",
      "appid": geolocatorApiKey,
    });

    dynamic response = await http.get(url);

    return json.decode(response.body)?[0];
  }
}

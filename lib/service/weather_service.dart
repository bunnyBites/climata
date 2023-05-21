import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiKey = "5a0b16ac65a349339b6960355fa9cc87";
const String baseUrl = "api.weatherbit.io";

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
}

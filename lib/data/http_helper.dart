import 'package:fitness_tracker/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  String authKey = "Enter your api key here";
  String baseURL = "api.openweathermap.org";
  String path = "data/2.5/weather";

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': authKey};
    Uri uri = Uri.https(baseURL, path, parameters);
    http.Response result = await http.get(uri);

    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);
    return weather;
  }
}

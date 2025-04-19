import 'package:new_weatherapp/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherServices {
  final String apiKey = 'Paste your Api Key here';

  Future<Weather> fetchWeather(String cityName) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Weather.fromJson(data);
      } else {
        final errorData = json.decode(response.body);
        throw Exception('Error: ${errorData["message"]}');
      }
    } catch (e) {
      throw Exception('Failed to fetch weather: $e');
    }
  }
}

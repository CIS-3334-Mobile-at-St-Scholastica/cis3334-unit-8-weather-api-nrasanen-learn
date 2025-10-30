import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherDataService{

  Future<List<WeatherData>> fetchWeatherData() async {
    final response = await http
        .get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&units=imperial&appid=5aa6c40803fbb300fe98c6728bdafce7'));
    if (response.statusCode == 200) {
      WeatherData weather = weatherDataFromJson(response.body);
      return weather.
    } else {
      throw Exception('Failed to get Weather Data');
    }
  }
}
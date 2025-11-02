import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherDataService{

  Future<List<ListElement>> fetchWeatherData() async {
    final response = await http
        .get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=duluth&units=imperial&cnt=8&appid=5aa6c40803fbb300fe98c6728bdafce7'));
    if (response.statusCode == 200) {
      WeatherData weatherData = weatherDataFromJson(response.body);
      return weatherData.list;
    } else {
      throw Exception('Failed to get Weather Data');
    }
  }
}
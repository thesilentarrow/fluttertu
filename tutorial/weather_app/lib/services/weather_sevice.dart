import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const BASE_URL = "http://api.openweathermap.org/data/2.5/weather";
  final String apiKey;

  WeatherService(this.apiKey);

  Future<Weather> getWeather(String cityName) async {
    final response = await http.get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately
      throw Exception('Location permissions are permanently denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
      // Fetch the current location
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
      );

      // Convert the location into a list of placemark objects
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      return placemarks.first.locality ?? 'Unknown';
    } else {
      throw Exception('Location permissions are denied');
    }
  }
}

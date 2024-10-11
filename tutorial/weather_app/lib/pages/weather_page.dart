import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_sevice.dart';
import 'package:permission_handler/permission_handler.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState()=> _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //api key
  final _weatherService = WeatherService('b20c94874a448434e999d87cb44f40b2');
  Weather? _weather;

  //fetch weather
  _fetchWeather() async {
    // Request location permissions
    var status = await Permission.location.request();
    if (status.isGranted) {
      //get the current city
      String cityName = await _weatherService.getCurrentCity();
      //get weather for city
      try {
        final weather = await _weatherService.getWeather(cityName);
        setState(() {
          _weather = weather;
        });
      } catch (e) {
        print(e);
      }
    } else {
      // Handle the case when permission is not granted
      print('Location permission not granted');
    }
  }
  //weather animation
  String getWeatherAnimation(String? mainCondition){
    if(mainCondition == null) return 'assets/sunny.json'; //default to sunny

    switch (mainCondition.toLowerCase()){
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloudy.json';
      case 'rain':
      case 'drizzle':
      case 'slower rain':
        return 'assets/rainy.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  //init state
  @override
  void initState() {
    super.initState();
    //fetch weather on startup
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            //city name
            Text(_weather?.cityName?? "loading city.."),

            //animation
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),


            //temperature
            Text('${_weather?.temperature.round()}*C'),

            //weather condition
            Text(_weather?.mainCondition??"")
          ]
        ),
      )
    );
  }
}
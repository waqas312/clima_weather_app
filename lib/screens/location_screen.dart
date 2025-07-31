import 'package:clima_wheather_app/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima_wheather_app/utilities/constant.dart';
import 'package:clima_wheather_app/services/weather.dart';
import 'package:flutter/services.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({this.locationWeather, super.key});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  int temperature = 0;
  String? weatherIcon;
  String? cityName;
  String? weatherMessage;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = '❌';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature);
      cityName = weatherData['name'];
    });
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 32, 50, 51), Color(0xFF66A6FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      constraints: const BoxConstraints.expand(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white.withOpacity(0.3),
                      shadowColor: Colors.black45,
                      elevation: 10,
                      padding: const EdgeInsets.all(18),
                    ),
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      if (!mounted) return;
                      updateUI(weatherData);
                    },
child: Icon(Icons.my_location, size: 30, color: Color.fromARGB(255, 44, 30, 30)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white.withOpacity(0.3),
                      shadowColor: Colors.black45,
                      elevation: 10,
                      padding: const EdgeInsets.all(18),
                    ),
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CityScreen()),
                      );
                      if (typedName != null) {
                        var weatherData = await weather.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: const Icon(Icons.location_city, size: 30, color: Color.fromARGB(255, 66, 49, 49)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$temperature°',
                    style: kTempTextStyle.copyWith(
                      fontSize: 90,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black45,
                          offset: Offset(3, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    weatherIcon ?? '',
                    style: kConditionTextStyle.copyWith(
                      fontSize: 70,
                      shadows: [
                        Shadow(
                          color: Colors.black38,
                          offset: Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  '${weatherMessage ?? ''} in ${cityName ?? ''}',
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle.copyWith(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        offset: Offset(2, 2),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
              ),
             Center(
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 43, 16, 16).withOpacity(0.2),
      foregroundColor: const Color.fromARGB(255, 8, 0, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      elevation: 7,
      shadowColor: const Color.fromARGB(96, 5, 5, 5),
    ),
    onPressed: () => SystemNavigator.pop(),
    child: const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.logout, size: 40),
        SizedBox(width: 15),
        Text("Exit", style: TextStyle(fontSize: 30)),
      ],
    ),
  ),
),
            ],
          ),
        ),
      ),
    ),
  );
}
}
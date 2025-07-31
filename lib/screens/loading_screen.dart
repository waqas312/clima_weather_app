
import 'package:clima_wheather_app/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima_wheather_app/services/weather.dart';


class LoadingScreen extends StatefulWidget {
 const LoadingScreen ({super.key});

  @override
  State<StatefulWidget> createState() =>
   _LoadingScreenState();
}


class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {

    super.initState();
    
    getLocation();
  }
void getLocation() async{
  WeatherModel weatherModel = WeatherModel();
  var weatherData = await weatherModel.getLocationWeather();
  
Navigator.push(context, MaterialPageRoute(builder: (context){
  return LocationScreen(locationWeather: weatherData);
}));

}








   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SpinKitCircle(
        color: Colors.white,
        size: 100,
      ),),
     
    );
  }
  
}
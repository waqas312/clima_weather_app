import 'package:flutter/material.dart';
import 'package:clima_wheather_app/utilities/constant.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.5),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(30),
                          right: Radius.circular(30),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      elevation: 10,
                      shadowColor: Colors.black54,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    label: const Text("Back"),
                  ),
                ),
                const SizedBox(height: 30.0),
   Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.horizontal(left: Radius.circular(20), right: Radius.circular(20)),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        offset: Offset(-4, 0), // Left shadow
        blurRadius: 8,
      ),
      BoxShadow(
        color: Colors.black12,
        offset: Offset(4, 0), // Right shadow
        blurRadius: 8,
      ),
    ],
  ),
  child: TextField(
    onChanged: (value) {
      setState(() {
        cityName = value;
      });
    },
    decoration: InputDecoration(
      hintText: 'Enter city name',
      hintStyle: TextStyle(color: Colors.grey),
      border: InputBorder.none,
      icon: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Icon(Icons.location_city, color: Colors.black),
      ),
    ),
    style: TextStyle(color: Colors.black),
  ),
),


                const SizedBox(height: 25.0),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(30),
                          right: Radius.circular(30),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      elevation: 10,
                      shadowColor: Colors.black45,
                    ),
                    onPressed: () {
                      Navigator.pop(context, cityName);
                    },
                    child: const Text(
                      'Get Weather',
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600,
                      ),
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

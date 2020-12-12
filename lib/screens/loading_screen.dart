
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';





class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;

  double longitude;

  @override
  void initState(){
    super.initState();
    getLocationData();
    print('this line of code is triggered');

  }


  void  getLocationData () async {

    var weatherData = await WeatherModel().getWeatherLocation();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return  LocationScreen(locationWeather: weatherData);
    }));

  }


  @override
  Widget build(BuildContext context) {
    //getData();
    return Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 10.0
          ),
      ),
    );
  }
}

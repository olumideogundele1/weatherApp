
import 'location.dart';
import 'networking.dart';

const apiKey = 'oluchiken';

class WeatherModel {

  Future<dynamic> getWeatherLocation() async{
    Location location = Location();
    await location.getLocation();
    NetworkHelper networkHelper = NetworkHelper(url:'https://samples.openweathermap.org/data/2.5/weather?'
        'lat=${location.latitude}e&lon=${location.longitude}&appid=$apiKey&units=metric');

    return await networkHelper.getData();
  }



  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

import 'package:Clima/services/location.dart';
import 'package:Clima/services/networking.dart';

const apikey = 'd6cef155946f2c2dfa2b17af3d7d53cf';
const openweathermap = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getcityweather(String cityName) async{
    Networking networking=Networking('$openweathermap?q=$cityName&appid=$apikey',);
    var weatherdata= await networking.GetData();
    return weatherdata;
  }
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.GetCurrentLocation();
    Networking networking = Networking(
      '$openweathermap?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey',
    );
    var weatherdata = await networking.GetData();
    return weatherdata;
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

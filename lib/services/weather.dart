import 'package:clima/services/location.dart';

import 'networking.dart';

const appKey = '0db506ce0633ebbc2df93f14d086c1b1';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    NetworkingHelper networkingHelper = NetworkingHelper(
        url:
            '$openWeatherMapUrl?lat=${loc.latitude}&lon=${loc.longitude}&appid=$appKey&units=metric');
    var weatherData = await networkingHelper.getData();
    return weatherData;
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
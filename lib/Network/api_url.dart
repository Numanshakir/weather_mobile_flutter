import 'package:weather_mobile_flutter/Constant/app_keys.dart';

class ApiUrl {
  static const baseUrl = "https://api.openweathermap.org/";
  static const imagebaseUrl = "https://openweathermap.org/";

  static const forecastURL = "${ApiUrl.baseUrl}data/2.5/forecast?";
  static const weatherbyLocationURL = "${ApiUrl.baseUrl}data/2.5/weather?";

  static getImageUrl(String icon) {
    return "${imagebaseUrl}img/wn/$icon@2x.png";
  }

  static getweatherbyLocationURL({required double lat, required double lon}) {
    return "${weatherbyLocationURL}lat=$lat&lon=$lon&units=metric&appid=${AppKeys.apiAppId}";
  }

  static getForecastWeatherbyLocationURL(
      {required double lat, required double lon}) {
    return "${forecastURL}lat=$lat&lon=$lon&units=metric&appid=${AppKeys.apiAppId}&exclude=minutely,current,hourly";
  }

  static getForecastWeatherbyCityURL({required String city}) {
    return "${forecastURL}q=$city&units=metric&appid=${AppKeys.apiAppId}&exclude=minutely,current,hourly";
  }
}

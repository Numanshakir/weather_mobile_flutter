import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_mobile_flutter/App/Home/Model/weather_model.dart';
import 'package:weather_mobile_flutter/App/SearchWeather/Service/search_service.dart';
import 'package:weather_mobile_flutter/Base/ViewModel/base_view_model.dart';

class SearchViewModel extends BaseViewModel with SearchService {
  TextEditingController cityController = TextEditingController();
  List<WeatherModel> forcastData = <WeatherModel>[];

  Future onFetchWeatherForcastData() async {
    try {
      forcastData =
          await onFetchWeatherbyCityService(city: cityController.value.text);
      notifyListeners();
    } catch (e) {}
  }

  @override
  FutureOr<void> init() {
    // TODO: implement init
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_mobile_flutter/App/Home/Model/weather_model.dart';
import 'package:weather_mobile_flutter/App/Home/Services/home_services.dart';
import 'package:weather_mobile_flutter/App/Location/ViewModel/location_view_model.dart';


class HomeViewModel extends ChangeNotifier with HomeService {

  WeatherModel weatherNow = WeatherModel.fromJson({});
  bool isLoading = false;

  Future onFecthWatherNow(BuildContext context) async {
    final locationVM = Provider.of<LocationViewModel>(context, listen: false);
    isLoading = true;
    weatherNow = await onFetchWeatherNowService(
        lat: locationVM.currentLocation.latitude,
        lon: locationVM.currentLocation.longitude);
    isLoading = false;
    notifyListeners();
  }

  List<WeatherModel> forcastData = <WeatherModel>[];

  Future onFetchWeatherForcastData(BuildContext context) async {
    final locationVM = Provider.of<LocationViewModel>(context, listen: false);
    forcastData = await onFetchWeatherForcastService(
        lat: locationVM.currentLocation.latitude,
        lon: locationVM.currentLocation.longitude);
    notifyListeners();
  }

 

  String getCurrentDateTime() {
    // Get current date and time
    DateTime now = DateTime.now();

    // Format the date and time according to the desired pattern
    String formattedDateTime =
        DateFormat('EEEE MMM dd, yyyy h:mm a').format(now);

    return formattedDateTime;
  }
}

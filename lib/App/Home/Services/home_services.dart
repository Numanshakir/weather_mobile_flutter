import 'package:dio/dio.dart';
import 'package:weather_mobile_flutter/App/Home/Model/weather_model.dart';
import 'package:weather_mobile_flutter/Network/api_client.dart';
import 'package:weather_mobile_flutter/Network/api_url.dart';
import 'package:weather_mobile_flutter/Utils/toast_message.dart';

mixin HomeService {
  Future<WeatherModel> onFetchWeatherNowService(
      {required double lat, required double lon}) async {
    WeatherModel weatherModel = WeatherModel.fromJson({});

    var response;
    String url = ApiUrl.getweatherbyLocationURL(lat: lat, lon: lon);
    response = await ApiClient(Dio()).getRequest(
      apiUrl: url,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      weatherModel = WeatherModel.fromJson(response.data);
    } else {
      ShowMessage.onFail("Something went wrong");
    }
    return weatherModel;
  }

  Future<List<WeatherModel>> onFetchWeatherForcastService(
      {required double lat, required double lon}) async {
    List<WeatherModel> forcastData = <WeatherModel>[];

    var response;
    String url = ApiUrl.getForecastWeatherbyLocationURL(lat: lat, lon: lon);
    response = await ApiClient(Dio()).getRequest(
      apiUrl: url,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      forcastData = WeatherModel.jsonToModelList(response.data["list"]);
    } else {
      ShowMessage.onFail("Something went wrong");
    }
    return forcastData;
  }
}

import 'package:dio/dio.dart';
import 'package:weather_mobile_flutter/App/Home/Model/weather_model.dart';
import 'package:weather_mobile_flutter/Network/api_client.dart';
import 'package:weather_mobile_flutter/Network/api_url.dart';
import 'package:weather_mobile_flutter/Utils/toast_message.dart';

mixin SearchService {
  Future<List<WeatherModel>> onFetchWeatherbyCityService(
      {required String city}) async {
    List<WeatherModel> forcastData = <WeatherModel>[];

    var response;
    String url = ApiUrl.getForecastWeatherbyCityURL(city: city);
    response = await ApiClient(Dio()).getRequest(
      apiUrl: url,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      forcastData = WeatherModel.jsonToModelList(response.data["list"]);
    } else {
      ShowMessage.onFail(response.data["message"]);
    }
    return forcastData;
  }
}

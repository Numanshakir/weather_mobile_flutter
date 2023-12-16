import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_mobile_flutter/Network/server_error.dart';
import 'package:weather_mobile_flutter/Utils/toast_message.dart';

part 'api_client_g.dart';

abstract class ApiClient {
  factory ApiClient(Dio dio) {
    dio.options = BaseOptions(
        receiveTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 60),
        headers: ({
          "Content-Type": "application/json",
        }));
    return _ApiClient(dio);
  }

  Future getRequest({
    required String apiUrl,
  });

  Future getRequestHeader({required String apiUrl, required String token});
}

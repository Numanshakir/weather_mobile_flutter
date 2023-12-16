import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_mobile_flutter/Theme/colors.dart';


class ShowMessage {
  static onSuccess(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: AppColor.primaryColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static onFail(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: AppColor.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

}
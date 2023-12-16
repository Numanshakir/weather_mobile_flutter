import 'package:flutter/material.dart';

class AppConfig {
  BuildContext context;
  double height = 30;
  double width = 50;

  AppConfig(this.context) {
    MediaQueryData queryData = MediaQuery.of(context);
    height = queryData.size.height;
    width = queryData.size.width;
  }
}

class Gap {
  static Widget h10() {
    return const SizedBox(
      height: 10,
    );
  }

  static Widget w10() {
    return const SizedBox(
      width: 10,
    );
  }

  static Widget h15() {
    return const SizedBox(
      height: 15,
    );
  }

  static Widget w15() {
    return const SizedBox(
      width: 15,
    );
  }

  static Widget h20() {
    return const SizedBox(
      height: 20,
    );
  }

  static Widget w20() {
    return const SizedBox(
      width: 10,
    );
  }

  static Widget h25() {
    return const SizedBox(
      height: 25,
    );
  }

  static Widget w25() {
    return const SizedBox(
      width: 25,
    );
  }

  static Widget h30() {
    return const SizedBox(
      height: 30,
    );
  }

  static Widget w30() {
    return const SizedBox(
      width: 30,
    );
  }

  static Widget h35() {
    return const SizedBox(
      height: 35,
    );
  }

  static Widget w35() {
    return const SizedBox(
      width: 35,
    );
  }

  static Widget h40() {
    return const SizedBox(
      height: 40,
    );
  }

  static Widget w40() {
    return const SizedBox(
      width: 40,
    );
  }

  static Widget h50() {
    return const SizedBox(
      height: 50,
    );
  }

  static Widget w50() {
    return const SizedBox(
      width: 50,
    );
  }

  static Widget h(double h) {
    return SizedBox(
      height: h,
    );
  }

  static Widget w(double w) {
    return SizedBox(
      width: w,
    );
  }
}

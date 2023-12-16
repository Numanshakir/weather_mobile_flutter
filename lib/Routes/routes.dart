import 'package:flutter/material.dart';
import 'package:weather_mobile_flutter/App/Home/View/home_view.dart';
import 'package:weather_mobile_flutter/App/SearchWeather/View/search_weather_view.dart';
import 'package:weather_mobile_flutter/App/Splash/View/splash_view.dart';
import 'package:weather_mobile_flutter/Routes/routes_names.dart';

class AppRoutes {
  static Route<dynamic> genrateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: ((context) {
          return SplashScreen();
        }));
      case RouteName.homeView:
        return MaterialPageRoute(builder: ((context) {
          return HomeView();
        }));
      case RouteName.searchWeatherView:
        return MaterialPageRoute(builder: ((context) {
          return SearchWeatherView();
        }));

        
      default:
        {
          return MaterialPageRoute(
              builder: ((context) => Scaffold(
                    body: Container(
                      child: Center(
                        child: Text("No Route"),
                      ),
                    ),
                  )));
        }
    }
  }
}

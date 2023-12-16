<h1 align="center">Weather App Flutter</h1>
<h2 align="center">Updated to Flutter 3.16.1</h2>


<p align="center">
  <img src="https://github.com/Numanshakir/weather_mobile_flutter/blob/master/assets/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202023-12-16%20at%2016.35.19.png?raw=true" width="20%" />
  <img src="https://github.com/Numanshakir/weather_mobile_flutter/blob/master/assets/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202023-12-16%20at%2016.35.35.png?raw=true" width="20%" />
  <img src="https://github.com/Numanshakir/weather_mobile_flutter/blob/master/assets/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202023-12-16%20at%2016.40.08.png?raw=true" width="20%" />
</p>

# Weather App Flutter

A simple weather App created using [Flutter](https://flutter.dev/) and [Dart](https://dart.dev/) and using API from [OpenWeatherMap](https://openweathermap.org/)

  Weather App [Documentation](https://docs.google.com/document/d/1wexNNI7kxKzETjC67PmTzqNcl66hJXso3D_bhSqp_h8/edit?usp=sharing).
  Android [APK](https://github.com/Numanshakir/weather_mobile_flutter/blob/master/assets/WeatherApp.apk).
 

## Features
- Automatically acquire user current location by using geolocator
- Search weather by city name
- Hourly weather forcast 
- 7 days weather information 

## How to Run
1. Create an account at [OpenWeatherMap](https://openweathermap.org/).
2. Then get your API key from https://home.openweathermap.org/api_keys.
3. Clone the repo
   ```sh
   git clone https://github.com/Numanshakir/weather_mobile_flutter.git
   ```
4. Install all the packages by typing
   ```sh
   flutter pub get
   ```
5. Navigate to **lib/Constant/app_keys.dart** and paste your API key to the apiKey variable
   ```dart
   String apiKey = 'Paste Your API Key Here';
   ```
6. Run the App

## Contact
- [Numan Shakir](https://github.com/Numanshakir/) | [Twitter](https://twitter.com/Numan_Shakir248) | [Instagram](https://www.instagram.com/numan_shakir.248/)

## License
Distributed under the MIT License. See `LICENSE` for more information.

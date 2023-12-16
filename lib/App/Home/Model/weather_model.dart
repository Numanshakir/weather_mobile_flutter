class WeatherModel {
  Coord coord;
  List<Weather> weather;
  String base;
  Main main;
  int visibility;
  Wind wind;
  Clouds clouds;
  int dt;
  Sys sys;
  int timezone;
  int id;
  String name;
  int cod;
  String dt_txt;
  WeatherModel({
    required this.coord,
    required this.weather,
    required this.dt_txt,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        coord: Coord.fromJson(json["coord"] ?? {}),
        weather: json["weather"] == null
            ? []
            : List<Weather>.from(
                json["weather"].map((x) => Weather.fromJson(x))),
        base: json["base"] ?? "",
        main: Main.fromJson(json["main"] ?? {}),
        visibility: json["visibility"] ?? 0,
        wind: Wind.fromJson(json["wind"] ?? {}),
        clouds: Clouds.fromJson(json["clouds"] ?? {}),
        dt: json["dt"] ?? 0,
        sys: Sys.fromJson(json["sys"] ?? {}),
        timezone: json["timezone"] ?? 0,
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        cod: json["cod"] ?? 0,
        dt_txt: json["dt_txt"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "coord": coord.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "base": base,
        "main": main.toJson(),
        "visibility": visibility,
        "wind": wind.toJson(),
        "clouds": clouds.toJson(),
        "dt": dt,
        "sys": sys.toJson(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
      };

  static jsonToModelList(List<dynamic> json) {
    return json.map<WeatherModel>((e) => WeatherModel.fromJson(e)).toList();
  }
}

class Clouds {
  int all;

  Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class Coord {
  dynamic lon;
  dynamic lat;

  Coord({
    required this.lon,
    required this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"] ?? 0.0,
        lat: json["lat"] ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}

class Main {
  dynamic temp;
  dynamic feelsLike;
  dynamic tempMin;
  dynamic tempMax;
  int pressure;
  int humidity;
  int seaLevel;
  int grndLevel;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"] ?? 0.0,
        feelsLike: json["feels_like"] ?? 0.0,
        tempMin: json["temp_min"] ?? 0.0,
        tempMax: json["temp_max"] ?? 0.0,
        pressure: json["pressure"] ?? 0,
        humidity: json["humidity"] ?? 0,
        seaLevel: json["sea_level"] ?? 0,
        grndLevel: json["grnd_level"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
      };
}

class Sys {
  String country;
  int sunrise;
  int sunset;

  Sys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        country: json["country"] ?? "",
        sunrise: json["sunrise"] ?? 0,
        sunset: json["sunset"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"] ?? "",
        main: json["main"] ?? "",
        description: json["description"] ?? "",
        icon: json["icon"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Wind {
  dynamic speed;
  int deg;
  dynamic gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"] ?? 0.0,
        deg: json["deg"] ?? 0,
        gust: json["gust"] ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}

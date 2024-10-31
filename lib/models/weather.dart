class WeatherData {
  final Coord coord;
  final List<Weather> weather;
  final Main main;
  final int dt;
  final String name;

  WeatherData({
    required this.coord,
    required this.weather,
    required this.main,
    required this.dt,
    required this.name,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      coord: Coord.fromJson(json['coord']),
      weather: List<Weather>.from(
        json['weather'].map(
          (json) => Weather.fromJson(json),
        ),
      ),
      main: Main.fromJson(json['main']),
      dt: json['dt'],
      name: json['name'],
    );
  }
}

class Coord {
  final double lon;
  final double lat;

  Coord({
    required this.lon,
    required this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lon: json['lon'],
      lat: json['lat'],
    );
  }
}

class Weather {
  final String main;
  final String description;

  Weather({
    required this.main,
    required this.description,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      main: json['main'],
      description: json['description'],
    );
  }
}

class Main {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'],
      feelsLike: json['feels_like'],
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
    );
  }
}

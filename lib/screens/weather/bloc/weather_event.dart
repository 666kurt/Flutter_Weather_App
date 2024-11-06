abstract class WeatherEvent {
  const WeatherEvent();
}

class FetchWeatherEvent extends WeatherEvent {
  final double lat;
  final double lon;

  const FetchWeatherEvent(this.lat, this.lon);
}

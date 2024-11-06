import 'package:weather_app/models/weather.dart';

abstract class WeatherState {
  const WeatherState();
}

// Состояние, возникающее при открытии приложения
class WeatherInitialState extends WeatherState {}

// Состояние, возникающее при загрузке данных
class WeatherLoadingState extends WeatherState {}

// Состояние, возникающее при успешном получении данных
class WeatherLoadedState extends WeatherState {
  final WeatherData weatherData;

  const WeatherLoadedState(this.weatherData);
}

// Состояние, возникающее при неуспешном получении данных
class WeatherErrorState extends WeatherState {
  final String error;

  const WeatherErrorState(this.error);
}

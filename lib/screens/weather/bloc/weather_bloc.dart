import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/screens/weather/bloc/weather_event.dart';
import 'package:weather_app/screens/weather/bloc/weather_state.dart';
import 'package:weather_app/services/network_service.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final NetworkService networkService;

  WeatherBloc(this.networkService) : super(WeatherInitialState()) {
    on<FetchWeatherEvent>((event, emit) async {
      // Вызываем состояние загрузки
      emit(WeatherLoadingState());

      try {
        final weatherData =
            await networkService.fetchData(event.lat, event.lon);
        // Вызываем состояние успешного получения данных отправляя туда weatherData
        emit(WeatherLoadedState(weatherData));
      } catch (error) {
        // Вызываем состояние неуспешного получения данных отправляя туда ошибку
        emit(WeatherErrorState(error.toString()));
      }
    });
  }
}

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather.dart';

class NetworkService {
  static const String _baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';
  static const String _apiKey = 'd20a25483e0ad689bf8c76f2a44c7bdb';

  final Dio _dio = Dio();

  Future<WeatherData> fetchData(double lat, double lon) async {
    try {
      final responce = await _dio.get(
        _baseUrl,
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'units': 'metric',
          'appid': _apiKey,
        },
      );

      if (responce.statusCode == 200) {
        return WeatherData.fromJson(responce.data);
      } else {
        throw Exception("Ошибка ответа: ${responce.statusCode}");
      }
    } catch (error) {
      throw Exception("Ошибка запроса: $error");
    }
  }
}

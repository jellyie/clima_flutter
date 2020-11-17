import 'package:clima/components/weatherdata.dart';

class ForecastData {
  final List list;

  ForecastData({this.list});

  factory ForecastData.fromJson(Map<String, dynamic> json) {
    List list = new List();

    for (dynamic e in json['list']) {
      WeatherData weatherdata = new WeatherData(
        date: new DateTime.fromMillisecondsSinceEpoch(e['dt'] * 1000),
        temperature: e['main']['temp'].toInt(),
        condition: e['weather'][0]['id'],
      );
      list.add(weatherdata);
    }

    return ForecastData(
      list: list,
    );
  }
}

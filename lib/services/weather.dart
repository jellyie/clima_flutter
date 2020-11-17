import 'package:clima/components/forecast_card.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

const apiKey = 'd35bd2f64a385d434a4d0dffd7b07c6b';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5';

IconData icon;
NetworkHelper networkHelper;
Location location = Location();

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        '$openWeatherMapURL/weather?q=$cityName&appid=$apiKey&units=metric';
    networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    await location.getCurrentLocation();

    networkHelper = NetworkHelper(
        '$openWeatherMapURL/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getFiveDayForecast([String cityName]) async {
    if (cityName != null) {
      networkHelper = NetworkHelper(
          '$openWeatherMapURL/forecast?q=$cityName&appid=$apiKey&units=metric');
    } else {
      await location.getCurrentLocation();
      networkHelper = NetworkHelper(
          '$openWeatherMapURL/forecast?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    }
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Widget getForecast(List<dynamic> w) {
    List<Widget> list = List<Widget>();
    for (int i = 4; i < w.length; i = i + 8) {
      list.add(
        new Expanded(
          child: ForecastCard(
            icon: w[i].getWeatherIcon(w[i].condition),
            primaryLabel: '${w[i].temperature}°',
            secondaryLabel: '${w[i].getWeekDay(w[i].date)}',
          ),
        ),
      );
    }
    return new Row(children: list);
  }
}

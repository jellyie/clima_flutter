import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherData {
  String name;
  String weatherDesc;
  int temperature;
  int maxTemperature;
  int wind;
  int humidity;
  var condition;
  DateTime date;

  WeatherData(
      {this.name,
      this.temperature,
      this.condition,
      this.date,
      this.maxTemperature,
      this.wind,
      this.humidity,
      this.weatherDesc});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
        name: json['name'],
        date: new DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
        temperature: json['main']['temp'].toInt(),
        maxTemperature: json['main']['temp_max'].toInt(),
        condition: json['weather'][0]['id'],
        wind: json['wind']['speed'].toInt(),
        humidity: json['main']['humidity'],
        weatherDesc: json['weather'][0]['description']);
  }

  String getWeekDay(DateTime date) {
    int weekday = date.weekday;
    switch (weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return 'Error';
    }
  }

  IconData getWeatherIcon(int condition) {
    if (condition < 300) {
      return FontAwesomeIcons.pooStorm;
    } else if (condition < 400) {
      return FontAwesomeIcons.cloudShowersHeavy;
    } else if (condition < 600) {
      return FontAwesomeIcons.umbrella;
    } else if (condition < 700) {
      return FontAwesomeIcons.solidSnowflake;
    } else if (condition < 800) {
      return FontAwesomeIcons.smog;
    } else if (condition == 800) {
      return FontAwesomeIcons.solidSun;
    } else if (condition <= 804) {
      return FontAwesomeIcons.cloud;
    } else {
      return FontAwesomeIcons.solidQuestionCircle;
    }
  }
}

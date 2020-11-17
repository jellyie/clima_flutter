import 'package:clima/components/weather_card.dart';
import 'package:clima/components/forecastdata.dart';
import 'package:clima/screens/city_screen.dart';
import 'package:clima/components/weatherdata.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather, this.locationForecast});

  final locationWeather;
  final locationForecast;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  WeatherData weatherdata;
  ForecastData forecastdata;

  String cityName;

  // Current Weather Data
  int temperature;
  int wind;
  int humidity;
  int maxTemperature;
  IconData weatherIcon;
  String weatherMessage;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather, widget.locationForecast);
  }

  void updateUI(dynamic weatherData, dynamic forecastData) {
    setState(() {
      if (weatherData == null || forecastData == null) {
        temperature = 0;
        weatherIcon = FontAwesomeIcons.questionCircle;
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        return;
      }
      weatherdata = WeatherData.fromJson(weatherData);
      forecastdata = ForecastData.fromJson(forecastData);

      // City Name
      cityName = weatherdata.name;

      // Current Temperature
      temperature = weatherdata.temperature;

      // Current Wind
      wind = weatherdata.wind;

      // Current Humidity
      humidity = weatherdata.humidity;

      // Current Maximum Temp
      maxTemperature = weatherdata.maxTemperature;

      // Current Weather Icon
      weatherIcon = weatherdata.getWeatherIcon(weatherdata.condition);

      // Current Weather Message
      weatherMessage = weatherdata.weatherDesc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      var forecastData = await weather.getFiveDayForecast();
                      updateUI(weatherData, forecastData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 30.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));

                      // Update UI to typed city's weather
                      if (typedName != null) {
                        var weatherData =
                            await weather.getCityWeather(typedName);
                        var forecastData =
                            await weather.getFiveDayForecast(typedName);
                        updateUI(weatherData, forecastData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 30.0,
                    ),
                  ),
                ],
              ), // Header buttons
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  '$cityName',
                  style: kLabelTextStyle,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 20.0),

              // Weather Temperature & Icon
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FaIcon(
                      weatherIcon,
                      size: 125.0,
                      color: Colors.indigo[300],
                    ),
                    SizedBox(height: 60.0),
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        weatherMessage,
                        style: kWeatherDescTextStyle,
                      ),
                    ),
                  ],
                ),
              ),

              // Detailed Current Forecast
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: WeatherCard(
                        primaryLabel: '$wind km/h',
                        secondaryLabel: 'Wind',
                      ),
                    ),
                    Expanded(
                      child: WeatherCard(
                        primaryLabel: '$humidity%',
                        secondaryLabel: 'Humidity',
                      ),
                    ),
                    Expanded(
                      child: WeatherCard(
                        primaryLabel: '$maxTemperature°',
                        secondaryLabel: 'Max',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              // 5-Day Forecast
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                child: weather.getForecast(forecastdata.list),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  WeatherCard({this.primaryLabel, this.secondaryLabel});

  final String primaryLabel;
  final String secondaryLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            primaryLabel,
            style: kNumberTextStyle,
          ),
          SizedBox(height: 15.0),
          Text(secondaryLabel, style: kDisabledTextStyle),
        ],
      ),
    );
  }
}

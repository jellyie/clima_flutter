import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForecastCard extends StatelessWidget {
  ForecastCard({this.icon, this.primaryLabel, this.secondaryLabel});

  final IconData icon;
  final String primaryLabel;
  final String secondaryLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            secondaryLabel,
            style: kDayofWkTextStyle,
          ),
          SizedBox(height: 15.0),
          FaIcon(
            icon,
            size: 28.0,
            color: Color(0xFF7986CB),
          ),
          SizedBox(height: 15.0),
          Text(primaryLabel, style: kNumberTextStyle),
        ],
      ),
    );
  }
}

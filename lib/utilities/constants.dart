import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Lato',
  fontSize: 60.0,
);

const kLabelTextStyle = TextStyle(fontFamily: 'OpenSans', fontSize: 40.0);

const kDayofWkTextStyle =
    TextStyle(fontFamily: 'Lato', fontSize: 15.0, fontWeight: FontWeight.w700);

const kNumberTextStyle = TextStyle(fontFamily: 'Lato', fontSize: 22.0);

const kDisabledTextStyle = TextStyle(
    fontFamily: 'Lato',
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: Color(0xFFB3B3B3));

const kWeatherDescTextStyle = TextStyle(
  fontFamily: 'Lato',
  fontSize: 18.0,
  fontWeight: FontWeight.w600,
  color: Color(0xFF7986CB),
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.location_city, color: Colors.grey),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

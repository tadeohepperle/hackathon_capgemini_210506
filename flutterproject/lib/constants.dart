import 'package:flutter/material.dart';

// here we put constants that we can use throughout the entire project
class Constants {
  static final String appTitle = 'Capgemini App';
  static final Color primaryColor = Colors.green[100];
  static final Color extColor = Colors.grey;
  static final Color backgroundColor = Colors.white;
  static final Color textColor = Colors.grey[900];
  static final fontSizeNormal = 18.00;
  static final fontSizeH2 = 24.00;
  static final fontSizeH1 = 48.00;
  static final double defaultPadding = 30.0;
  static final String backendURL = "https://www.schwimmbadberlin.de/capgemini";
  static final TextStyle textStyleNormal = TextStyle(
      fontSize: fontSizeNormal, fontWeight: FontWeight.bold, color: textColor);
  static final TextStyle textStyleH2 = TextStyle(
      fontSize: fontSizeH2, fontWeight: FontWeight.bold, color: textColor);
  static final TextStyle textStyleSmall = TextStyle(
      fontSize: fontSizeNormal, fontStyle: FontStyle.italic, color: textColor);
  static final BoxDecoration boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  );
}

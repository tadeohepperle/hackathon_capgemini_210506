import 'package:flutter/material.dart';

// here we put constants that we can use throughout the entire project
class Constants {
  static String userEmail;
  static String username;
  static final String appTitle = 'Capgemini App';
  static final Color primaryColor = Colors.green;
  static final Color extColor = Colors.grey;
  static final Color backgroundColor = Colors.white;
  static final Color textColor = Colors.grey[900];
  static final fontSizeNormal = 18.00;
  static final fontSizeH2 = 24.00;
  static final fontSizeH1 = 40.00;
  static final double defaultPadding = 30.0;
  static final String backendURL = "https://www.schwimmbadberlin.de/capgemini";
  static final TextStyle textStyleNormal = TextStyle(
      fontSize: fontSizeNormal, fontWeight: FontWeight.bold, color: textColor);
  static final TextStyle textStyleH2 = TextStyle(
      fontSize: fontSizeH2, fontWeight: FontWeight.bold, color: textColor);
  static final TextStyle textStyleH1 = TextStyle(
      fontSize: fontSizeH1, fontWeight: FontWeight.bold, color: textColor);
  static final TextStyle textStyleSmall = TextStyle(
      fontSize: fontSizeNormal, fontStyle: FontStyle.italic, color: textColor);
  static final BoxDecoration boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: primaryColor,
  );
}

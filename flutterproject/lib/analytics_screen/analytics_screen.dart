import 'package:hackathon_capgemini_210506/constants.dart';
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  AnalyticsScreen({Key key}) : super(key: key);

  @override
  _AnalyticsScreenState createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  build(BuildContext context) {
    return Container(
      color: Constants.backgroundColor,
      child: Text("Analytics Screen"),
    );
  }
}

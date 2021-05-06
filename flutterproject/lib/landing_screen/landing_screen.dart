import 'package:hackathon_capgemini_210506/constants.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  build(BuildContext context) {
    return Container(
      child: Container(
          color: Constants.backgroundColor, child: Text("Landing Page")),
    );
  }
}

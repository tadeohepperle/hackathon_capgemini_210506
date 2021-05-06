import 'package:hackathon_capgemini_210506/constants.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatefulWidget {
  DataScreen({Key key}) : super(key: key);

  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  build(BuildContext context) {
    return Container(
      child: Container(
          color: Constants.backgroundColor, child: Text("Data Screen")),
    );
  }
}

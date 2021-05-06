import 'package:flutter/material.dart';
import 'package:hackathon_capgemini_210506/constants.dart';
import 'package:hackathon_capgemini_210506/landing_screen/landing_screen.dart';
import 'package:hackathon_capgemini_210506/data_screen/data_screen.dart';
import 'package:hackathon_capgemini_210506/analytics_screen/analytics_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appTitle,
      theme: ThemeData(
        primarySwatch: Constants.primaryColor,
      ),
      home: OverarchingHomeComponent(),
    );
  }
}

class OverarchingHomeComponent extends StatefulWidget {
  OverarchingHomeComponent({Key key}) : super(key: key);

  @override
  _OverarchingHomeComponentState createState() =>
      _OverarchingHomeComponentState();
}

class _OverarchingHomeComponentState extends State<OverarchingHomeComponent> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          title: Text('Tabs Demo'),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            LandingScreen(),
          ],
        ),
      ),
    );
  }
}

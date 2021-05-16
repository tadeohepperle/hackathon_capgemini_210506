import 'package:flutter/material.dart';
import 'package:hackathon_capgemini_210506/constants.dart';
import 'package:hackathon_capgemini_210506/landing_screen/landing_screen.dart';
import 'package:hackathon_capgemini_210506/data_screen/data_screen.dart';
import 'package:hackathon_capgemini_210506/analytics_screen/analytics_screen.dart';
import 'package:hackathon_capgemini_210506/news_screen/news_screen.dart';
import 'package:hackathon_capgemini_210506/google_auth/main_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appTitle,
      theme: ThemeData(primarySwatch: Colors.green),
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
              Tab(icon: Icon(Icons.backup_table)),
              Tab(icon: Icon(Icons.backup_table)),
              Tab(icon: Icon(Icons.explore))
            ],
          ),
          title: Text('Carbon Crunch - CO² Checker'),
        ),
        body: TabBarView(
          children: [LandingScreen(), NewsScreen(), HomePage()],
        ),
      ),
    );
  }
}

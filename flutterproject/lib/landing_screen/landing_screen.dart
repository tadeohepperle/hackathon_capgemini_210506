import 'package:hackathon_capgemini_210506/constants.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_capgemini_210506/dataService.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

//Das erste ist immer der Parametername

//Column gibt Widget zurück

enum UIState { preButtonClick, loading, postButtonClick }

class _LandingScreenState extends State<LandingScreen> {
  void initialization() {
    //
    uiState = UIState.preButtonClick;
  }

  UIState uiState;
  Recipe recipe;

  void submitButtonPressed() {
    // ist url valid

    print("hallo");
    setState(() {
      //uiState update
    });

    // api call
    // await getChefkochDataFromURL

    //if()

    setState(() {
      //uiState update to post
      // set recipe
    });
  }

  @override
  void initState() {
    super.initState();
    initialization();
  }

  @override
  build(BuildContext context) {
    List<Widget> children = [];

    return Container(
        color: Constants.backgroundColor,
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: children,
        ));
  }
}

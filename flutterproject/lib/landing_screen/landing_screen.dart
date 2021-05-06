import 'package:hackathon_capgemini_210506/constants.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_capgemini_210506/dataService.dart';
import 'dart:async';
import 'package:hackathon_capgemini_210506/landing_screen/recipeCard.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

//Das erste ist immer der Parametername

//Column gibt Widget zurück

enum UIState { preButtonClick, loading, postButtonClick }

class _LandingScreenState extends State<LandingScreen> {
  UIState uiState;
  void initialization() {
    //
    inputRightNow = "";
    uiState = UIState.preButtonClick;
  }

  int counter = 0;
  Recipe recipe;
  String inputRightNow;

  void submitButtonPressed() async {
    print(inputRightNow);
    setState(() {
      //uiState update
      uiState = UIState.loading;
    });

    // api call

    Recipe recipeFromAPI = await getChefkochDataFromURL(inputRightNow);

    setState(() {
      recipe = recipeFromAPI;
    });
    // await getChefkochDataFromURL

    //if()
  }

  @override
  void initState() {
    super.initState();
    initialization();
  }

  @override
  build(BuildContext context) {
    List<Widget> children;

    children = [
      Container(
        height: 50,
        color: Constants.primaryColor,
        child: Center(child: Text('Sag uns was du essen willst!')),
      ),
      Padding(
        padding: EdgeInsets.all(16.0),
      ),
      TextField(
        onChanged: (String value) {
          inputRightNow = value;
        },
        obscureText: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Link',
        ),
      ),
      Padding(
        padding: EdgeInsets.all(16.0),
      ),
      FlatButton(
        focusColor: Colors.red,
        color: Constants.primaryColor,
        hoverColor: Colors.green,
        splashColor: Colors.white,
        onPressed: () {
          submitButtonPressed();
        },
        child: Text('Los!'),
      ),
      /*Container(
                child: Image(
                    image: NetworkImage(
                        'https://media.giphy.com/media/3oEjI6SIIHBdRxXI40/giphy.gif'))), */
    ];

    if (uiState == UIState.preButtonClick) {
      children;
    } else {
      /*children.add(FlatButton(
        focusColor: Colors.red,
        color: Constants.primaryColor,
        hoverColor: Colors.green,
        splashColor: Colors.white,
        onPressed: () {
          submitButtonPressed();
        },
        child: Text('Los!'),
      )); */
      children.add(RecipeCard(
        recipe: recipe,
      ));
    }

    return Container(
        color: Constants.backgroundColor,
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: children,
        ));
  }
}

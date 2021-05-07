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

enum UIState { preButtonClick, loading, postButtonClick, error }

class _LandingScreenState extends State<LandingScreen> {
  UIState uiState;
  void initialization() {
    //
    inputRightNow = "";
    uiState = UIState.preButtonClick;
  }

  int counter = 0;
  Recipe recipe = Recipe.example;
  String inputRightNow;

  void submitButtonPressed() async {
    print(inputRightNow);
    setState(() {
      //uiState update
      uiState = UIState.loading;
    });

    // api call
    Recipe recipeFromAPI = await getChefkochDataFromURL(inputRightNow);
    if (recipeFromAPI == null) {
      setState(() {
        uiState = UIState.error;
        recipe = null;
      });
    } else {
      setState(() {
        uiState = UIState.postButtonClick;
        recipe = recipeFromAPI;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initialization();
  }

  @override
  build(BuildContext context) {
    recipe = Recipe.example;
    List<Widget> children = [
      Container(
        height: 50,
        color: Constants.primaryColor,
        child: Center(
            child: Text('Sag uns was du essen willst!',
                style: Constants.textStyleNormal)),
      ),
      Container(
          margin: EdgeInsets.symmetric(vertical: Constants.defaultPadding),
          child: TextField(
            onChanged: (String value) {
              inputRightNow = value;
            },
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Chefkoch.de URL',
            ),
          )),
      FlatButton(
        height: 50,
        focusColor: Colors.red,
        color: Constants.primaryColor,
        hoverColor: Colors.green,
        splashColor: Colors.white,
        onPressed: () {
          submitButtonPressed();
        },
        child: Text('CO² Fußabdruck checken', style: Constants.textStyleNormal),
      ),
    ];

    if (uiState == UIState.error) children.add(ErrorScreen());
    if (uiState == UIState.loading) children.add(CircularProgressIndicator());
    if (uiState == UIState.postButtonClick) RecipeCard(recipe: recipe);

    return Container(
        color: Constants.backgroundColor,
        child: ListView(
          padding: EdgeInsets.all(Constants.defaultPadding),
          children: children,
        ));
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Constants.defaultPadding),
      child: Text(
          "Es tut uns Leid, es ist ein Fehler aufgetreten, bitte versuchen Sie es erneut.",
          style: TextStyle(color: Colors.red, fontSize: 16),
          textAlign: TextAlign.center),
    );
  }
}

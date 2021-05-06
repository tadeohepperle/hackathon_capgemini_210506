import 'package:flutter/material.dart';
import 'package:hackathon_capgemini_210506/dataService.dart';
import 'package:hackathon_capgemini_210506/constants.dart';

class RecipeCard extends StatelessWidget {
  Recipe recipe;
  RecipeCard({this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.backgroundColor,
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: SizedBox(
            width: 500,
            height: 500,
            child: ListView(padding: EdgeInsets.all(8), children: [
              Image.network(
                recipe.imageURL,
                fit: BoxFit.fill,
                height: 200,
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
              ),
              Text(
                recipe.title,
                textAlign: TextAlign.center,
                style: TextStyle(height: 2, fontSize: 20),
              ),
              Text(
                recipe.chefkochURL,
                textAlign: TextAlign.center,
                style: TextStyle(height: 2, fontSize: 20),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
